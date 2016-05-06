class CartsController < ApplicationController
 
	def index
		#raise session[:cart].inspect
 		@cart_items = session[:cart]
 		@ordered_looks = {}
 		@total = 0
 		# @pickup_time = 0
 		@cart_items.each do |look_id, quantity|
  	look = Look.find_by_id(look_id)
   	@ordered_looks[look_id] = { look: look, quantity: quantity}
  	end unless session[:cart].nil?	
		@current_order.ordered_items = @ordered_looks
		session[:order]["items"] = @ordered_looks
 	end

	def destroy
  	look_id = params[:id]
    @cart.cart_data.delete(look_id)
    redirect_to carts_path
 	end

end
