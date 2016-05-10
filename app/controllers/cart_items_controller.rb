class CartItemsController < ApplicationController
	
	def create
		@cart.increment(params[:look_id])
		session[:cart] = @cart.cart_data
		respond_to do |format|
			format.html	
			format.js
		end
	end

	def destroy
		@cart.destroy
		session.delete(:cart)
	end

	def delete
		@cart.delete(:item_id)
	end

	def update
		cart = cart_params
		look_id = cart[:look_id]
		quantity = cart[:quantity]
		session[:cart][look_id] = quantity.to_i
		session[:order]["items"][look_id]["qty"] = quantity.to_i
		session[:order]["details"] = order_params
		render json: {data: look_id}
	end

	private

	def cart_params
		params.require(:cart_items).permit(:look_id, :quantity)
	end

	def order_params
		params.require(:order_details).permit(:total)
	end

end
