class Admin::AccessoriesController < ApplicationController


def index
	@accessories = Accessory.all
end	
	

def new 
	@accessory = Accessory.new
end	
def create
    @accessory = Accessory.new(accessories_params)
      if @Accessory.save
        flash[:notice] = "accessory successfully created"
        redirect_to admin_accessories_path
      else
        render :action => 'new'
      end
    end

def update
end

def edit
end

def show
end 

def	destroy
end	
 			
private

def accessories_params
	parms.require(:Accessory).permit(:acc_name,:variant, :price,:product_id)
end 	

end
