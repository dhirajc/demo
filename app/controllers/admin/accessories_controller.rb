class Admin::AccessoriesController < Admin::BaseController
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
# 	respond_to do |format|
# 		format.html
#   @accessory = Accessory.find(params[:id])
#   # respond_to do |format|
#   #   format.html
# 		format.json {render json: @accessory.to_json(:only => [ :id,:acc_name, :price, :product_id, :variant ], :methods => [:avatar_url]) }

# 		#render :json => @model.to_json(:only => [:id,:name,:homephone,:cellphone])
# 	end
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

def order_all
	@orders = Order.all
end
			
private

def accessories_params
	params.require(:accessory).permit(:acc_name,:variant, :price ,:acc_avatar  , :product_id , :quantity)
end 	

end
