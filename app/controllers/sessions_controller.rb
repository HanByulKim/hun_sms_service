class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      log_in(user) #session[:user_id] = user.id # keep signin in server
      redirect_to '/'
    else
      flash[:alert] = '이메일 또는 비밀번호가 틀림'
      redirect_to new_session_path
    end
  end
  
  def destroy
    log_out
    
    redirect_to '/'
  end
end
