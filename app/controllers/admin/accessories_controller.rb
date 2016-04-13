class Admin::AccessoriesController < ApplicationController
before_filter :authorize_admin



def authorize_admin
  return unless !current_user.admin?
    redirect_to root_path, alert: 'You are not authorized to access this page!'
end

def index
	@accessories = Accessory.all
end	
	

def new 
	@accessory = Accessory.new
end	

def create
  @accessory = Accessory.new(accessories_params)
    if @accessory.save
      flash[:notice] = "Accessory successfully created"
      redirect_to admin_accessories_path
    else
      render :action => 'new'
    end
end

def show
  @accessory = Accessory.find(params[:id])
end

def edit
  @accessory = Accessory.find(params[:id])
end

def update
  @accessory = Accessory.find(params[:id])
  if @accessory.update_attributes(accessories_params)
   redirect_to admin_accessories_path , :notice => "Updated Successfully"
 else
   render 'edit'
 end
end

def destroy
  @accessory = Accessory.find(params[:id])
  @accessory.destroy
  flash[:notice] = "Accessory successfully destroyed"
  redirect_to admin_accessories_path
end
 			
private

def accessories_params
	params.require(:accessory).permit(:acc_name,:variant, :price ,:acc_avatar  , :product_id)
end 	

end
