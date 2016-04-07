class Admin::ProductsController < ApplicationController
	before_filter :authorize_admin


	def authorize_admin
 		return unless !current_user.admin?
  		redirect_to root_path, alert: 'You are not authorized to access this page!'
 	end

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
		@product = Product.find(params[:id])
 			if @product.update_attributes(product_params)
 				flash[:notice] = 'Successfully updated'
      	redirect_to new_admin_product_path
    	else
      	render 'edit'
    	end
  end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		flash[:notice] = "Product successfully destroyed"
		redirect_to :back
	end

 	private

		def product_params
			params.require(:product).permit(:name , :description, :avatar)
		end

end
