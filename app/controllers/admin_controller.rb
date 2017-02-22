class AdminController < ApplicationController
  before_action :authenticate#, only: [:sendtest]
  before_action :authenticate_admin#, only: [:sendtest]
  
  def panel
    
  end
  
  def prev_list
    @member = Member.all
  end
  
  def session_list
    @member = User.where(admin: false)
  end
  
  def admin_list
    @member = User.where(admin: true)
  end
  
  def register
    @member = Member.all
  end
  
  def publicity
    @member = Member.all
    @session = User.where(admin: false)
  end
  
  def publicity_new
    @session = User.where(admin: false)
  end
  
  def admin_enrollment
    
  end
  
  def admin_enrollment_create
    newadmin = User.where(email: params[:email]).first
    if newadmin == nil
      redirect_to '/error'
    else
      newadmin.admin = true
      newadmin.save
      redirect_to '/admin/admin_list'
    end
  end
  
  def delete
    target = User.find(params[:uid])
    target.admin = false
    target.save
    redirect_to '/admin/admin_list'
  end
      
  def create
    Member.create(name: params[:name], phone: params[:phone], residence: params[:residence], elec_constit: params[:elec_constit], support_ide: params[:support_ide], age: params[:age], sex: params[:sex], recog: params[:recog],
                support_re: params[:support_re], par_eval: params[:par_eval], support_gov: params[:support_gov], support_party: params[:support_party], governer: params[:governer], job: params[:job], position: params[:position],
                homenum: params[:homenum], compnum: params[:compnum], email: params[:email], recommender: params[:recommender], native: params[:native], birth: params[:birth], partyfee: params[:partyfee])
    redirect_to '/admin'
  end
  
  def sendtext
    accountSID = ENV['TWILIO_SID']
    authToken = ENV['TWILIO_AUTH']
    @client = Twilio::REST::Client.new accountSID, authToken #Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token  
    from = ENV['BASE_NUM']
    
    User.where(admin: false).find_each do |key, value| 
      message = @client.account.messages.create(
        :from=> from,
        :to=> key.phone,
        :body=> params[:script]
      )
      puts "Sent message" 
    end
    
    redirect_to '/admin'
  end
end
