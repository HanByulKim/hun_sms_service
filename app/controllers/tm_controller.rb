class TmController < ApplicationController
  before_action :authenticate#, only: [:sendtest]
  before_action :authenticate_admin#, only: [:sendtest]
  
  def sendtest
    accountSID = ENV['TWILIO_SID']
    authToken = ENV['TWILIO_AUTH']
    @client = Twilio::REST::Client.new accountSID, authToken #Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token  
    from = ENV['BASE_NUM']
    friends = {'+821065101264' => "HBK"}
    
    #frineds.each do |key, value|
      message = @client.account.messages.create(
        :from=> from,
        :to=> '+821031282001',
        :body=> "Hi"
      )
      puts "Sent message" 
    #end
    
    redirect_to '/'
  end
#    skip_before_action :verify_authenticity_token
 # rescue_from StandardError do |exception|
  #  trigger_sms_alerts(exception)
  #end
  
end