class UsersController < ApplicationController

def myaccount
	@user = User.find(current_user.id)
	# User.send_text_message
end

def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:notice] = 'Successfully updated'
			redirect_to myaccount_path
		else
			render 'edit'
		end
end

private

def user_params
	params.require(:user).permit(:name , :contact_no, :email , :address)
end
end
