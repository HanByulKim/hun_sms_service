class AdminController < ApplicationController
  before_action :authenticate#, only: [:sendtest]
  before_action :authenticate_admin#, only: [:sendtest]
  
  def panel
    @mem = Member.count
    @usr = User.count
    @pub = HistoryText.count
    @vid = Video.count
    @new = News.count
    @adm = User.where(admin: true).count
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
  
  def sendtext_user
    accountSID = ENV['TWILIO_SID']
    authToken = ENV['TWILIO_AUTH']
    @client = Twilio::REST::Client.new accountSID, authToken #Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token  
    from = ENV['BASE_NUM']
    
    User.where(admin: false).find_each do |key| 
      message = @client.account.messages.create(
        :from=> from,
        :to=> key.phone,
        :body=> params[:script]
      )
      puts "Sent message" 
    end
    
    HistoryText.create(script: params[:script], sender: params[:sender])
    
    redirect_to '/admin/publicity_new'
  end
  
  def video
    
  end
  
  def video_create
    Video.create(title: params[:title], subtitle: params[:subtitle], videoid: params[:videoid], videolink: params[:videolink], publisher: params[:publisher])
    
    redirect_to '/admin/video'
  end
  
  def news
  
  end
  
  def news_create
    News.create(title: params[:title], subtitle: params[:subtitle], script: params[:script], posted: params[:posted], imgurl: params[:imgurl], publisher: params[:publisher])
    redirect_to '/admin/news'
  end
  
  def publicity_history
    @history = HistoryText.all.reverse
  end
  
  def statistics_member
    @residence = Array.new
    @supp_party = Array.new
    @residence = Array.new
    
    for i in 1..5
      @residence << Member.where(residence: i).count
    end
    
    for i in 1..6
      @supp_party << Member.where(support_party: i).count
    end
  end
  
  def statistics_member_record
    redirect_to '/admin/statistics/member'
  end
  
  def statistics_post
    @views_news = Array.new
    @views_video = Array.new
    @interest_news = Array.new
    @interest_video = Array.new
    @datelabel = Array.new
    
    if(News.count < 10)
      for i in News.count..9
        @views_news << 0
      end
      for i in 0..News.count-1
        temp = News.find(News.count - i)
        @views_news << temp.views
      end
    else
      for i in 0..9
        temp = News.find(News.count - i)
        @views_news << temp.views
      end
    end
    
    if(Video.count < 10)
      for i in Video.count..9
        @views_video << 0
      end
      for i in 0..Video.count-1
        temp = Video.find(Video.count - i)
        @views_video << temp.views
      end
    else
      for i in 0..9
        temp = Video.find(Video.count - i)
        @views_video << temp.views
      end
    end
  
    for i in 0..9
      temp = Likenews.where("date(created_at) in (?)", Date.today - i)
      @interest_news << temp.count
      temp = Likevideo.where("date(created_at) in (?)", Date.today - i)
      @interest_video << temp.count
      @datelabel << (Date.today - i).strftime("%m.%d")
    end
  end
end
