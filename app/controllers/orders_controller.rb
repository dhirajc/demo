class OrdersController < ApplicationController
	
	def index
		@user = User.find(params[:user_id])
		@orders = @user.orders
	end

	# def order_all
	# 	@orders = Order.all
	# end
end
