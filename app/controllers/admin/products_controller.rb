class Admin::ProductsController < ApplicationController

	def new
		@product = Product.new
		@products = Product.all
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

	def edit
		@product = Product.find(params[:id])
	end

	def update
 			if @product.update(product_params)
 				flash[:notice] = 'Successfully updated'
      	redirect_to new_admin_product_path
    	else
      	render 'edit'
    	end
  end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		flash[:notice] = "Product successfully destroyed "
		redirect_to :back
	end

 	private

		def product_params
			params.require(:product).permit(:name , :description, :avatar)
		end

end
