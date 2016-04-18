class UsersController < ApplicationController

def myaccount
	@user = User.find(current_user.id)
end

end
