class Current_Order
	attr_accessor :ordered_items
	attr_accessor :total
	attr_accessor :sub_total

	def initialize(current_order)
		@ordered_items = current_order["items"] || {}
		current_order["details"] ||= {}
		@total = current_order["details"]["total"].to_i || 0
		# @delivery_cost = 500
		@sub_total = current_order["details"]["sub_total"].to_i || 0
		@user = {}
		@invoice = ""
		@transaction_id = ""
		@status = "pending"
	end

	def vat
		0.1 * @sub_total
	end

	def update_order(order, args)
		@ordered_items = order["items"] || {}
		@total = order["details"]["total"] || 0
		@invoice = args[:invoice] || ""
		@transaction_id = args[:transaction_id] || ""
		@status = args[:status] || "pending"
	end

	def self.send_text_message(current_order)
  	@current_order = current_order
    total =  @current_order.total.inspect
    number_to_send_to = "+919028959052"
    twilio_sid = "AC8c3453bcd97314eea20b996c94e44c56"
    twilio_token = "795dd5ff31906865a13cd364c6483c0a"
    twilio_phone_number = "15677034351"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    @twilio_client.account.sms.messages.create(
      from: "#{twilio_phone_number}",
      to: number_to_send_to,
      body: "Your order is in process. Total amount is #{total}"
      )
  end

	def paypal_url(current_user, return_url)
		@user = current_user
		values = {
			:business => 'dchachada-facilitator@delaplex.in',
			:cmd => '_cart',
			:upload => 1,
			:rm => 2,
			:return => return_url,
			:notify_url => @user.email,			
		}
		counter = 1

		@ordered_items.each do |index, details|
			values.merge!({
				"amount_#{counter}" => details['look']['price'],
				"item_name_#{counter}" => details['look']['name'],
				"quantity_#{counter}" => details["qty"]
				})
				counter += 1
			end
			"https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
	end

	def save_order(current_user)

		# binding.pry
		user = current_user
		new_order = user.orders.new(total: @total, invoice: @invoice, transaction_id: @transaction_id)
		save_successful = new_order.save
			if save_successful
				@ordered_items.each do |index, details|
					new_order.order_items <<
						OrderItem.create(look_id: details["look"]["id"],
															quantity: details["quantity"])
	end
end
# send_text_message
save_successful

end
end