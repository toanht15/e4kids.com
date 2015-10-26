class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_current_user
  
  def set_current_user
    User.current_user = current_user
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:signup).concat [:name, :gender, :age]
    devise_parameter_sanitizer.for(:account_update).concat [:name, :gender, :age]
    
  end
end
