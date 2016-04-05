class Admin::ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
			if @product.save
				flash[:notice] = "Product successfully created"
				redirect_to admin_dashboard_index_path
			else
				render :action => 'new'
			end
	end


 	private

		def product_params
			params.require(:product).permit(:name , :description,:avatar)
		end

end
