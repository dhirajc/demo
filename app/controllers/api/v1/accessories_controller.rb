class Api::V1::AccessoriesController < ApplicationController

 respond_to :json

def show
	 @accessory = Accessory.find(params[:id])
	 respond_with  @accessory.to_json(:only => [ :id,:acc_name, :price, :product_id, :variant ], :methods => [:avatar_url]) 
	#respond_to do |format|
    #format.json {render json: @accessory.to_json(:only => [ :id,:acc_name, :price, :product_id, :variant ], :methods => [:avatar_url]) }
	#
end

end
