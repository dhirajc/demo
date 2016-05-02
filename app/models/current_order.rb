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
		@invoice = " "
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

	def paypal_url(current_user, return_url)
		@user = current_user
		values = {

			
		}
		
	end

end