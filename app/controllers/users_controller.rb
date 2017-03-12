class UsersController < ApplicationController
  def new
  end
  
  def create
    User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation],
                name: params[:name], job: params[:job], phone: params[:phone])
    redirect_to '/'
  end
  
  def invitation
    
  end
  
  def invitation_sendtext
    accountSID = ENV['TWILIO_SID']
    authToken = ENV['TWILIO_AUTH']
    @client = Twilio::REST::Client.new accountSID, authToken #Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token  
    from = ENV['BASE_NUM']
    friends = {'+821065101264' => "HBK"}
    
    #frineds.each do |key, value| 
      message = @client.account.messages.create(
        :from=> from,
        :to=> params[:phone],
        :body=> "Hi"
      )
      puts "Sent message" 
    #end
    
    redirect_to '/users/invitation'
  end
end
