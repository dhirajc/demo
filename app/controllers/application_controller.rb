class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_action :configure_permitted_parameters, if: :devise_controller?




  def after_sign_in_path_for(resource)
    if current_user.admin?
    	admin_dashboard_index_path
    else
    	root_path
    end
  end

  def load_cart
    @cart ||= Cart.new(session[:cart])
  end

  def load_current_order
    session[:order] ||= {}
    @current_order ||= Current_Order.new(session[:order])
  end

  def cart
    @cart
  end

  before_action :load_cart
  #before_action :current_user
  before_action :load_current_order

  helper_method :cart
  helper_method :current_order


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :contact_no,:address) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password,:name,:contact_no,:address) }
  end


end
