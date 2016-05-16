class Admin::BaseController < ApplicationController
	before_filter :authorize_admin
	layout 'admin'


	def authorize_admin
 		return unless !current_user.admin?
  		redirect_to root_path, alert: 'You are not authorized to access this page!'
 	end
end
