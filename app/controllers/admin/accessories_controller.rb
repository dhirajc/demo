class Admin::AccessoriesController < ApplicationController


def index
	@accessories = Accessory.all
end	
	

def new 
	@accessory = Accessory.new
end	

def create
  redirect_to :back
  # @accessory = Accessory.new(accessories_params)
  #   if @accessory.save
  #     flash[:notice] = "accessory successfully created"
  #     redirect_to admin_accessories_path
  #   else
  #     render :action => 'new'
  #   end
end

def show

end



 			
private

def accessories_params
	params.require(:accessory).permit(:acc_name,:variant, :price , :product_id)
end 	

end
