class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  
  def authenticate
    if !user_signed_in?
      redirect_to new_session_path
    end
  end
  
  def authenticate_admin
    unless current_user.admin
      flash[:alert] = 'no admin'
      redirect_to '/'
    end
  end
end
