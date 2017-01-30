class UsersController < ApplicationController
  def new
  end
  
  def create
    User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation],
                name: params[:name], job: params[:job], phone: params[:phone])
    redirect_to '/'
  end
end
