class FittingsController < ApplicationController
  def index
  	@fittings = Fitting.where(:user_id => current_user.id)
  end

  def new
  	@fitting = Fitting.new
  end
  def create
  	@fitting = Fitting.create(fittings_params)
		if @fitting.save
			flash[:notice] = "Fitting Successfully created"
			redirect_to :back
		else
			render :new
			flash[:notice] = "Please enter Fittings detail properly"
		end
  end

   def fittings_params
    params.require(:fitting).permit(:pant_size,:weight,:shrit_size,:shoe_size,:height,:user_id,:look_id )
   end
end