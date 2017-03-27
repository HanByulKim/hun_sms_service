class User < ActiveRecord::Base
    has_secure_password
    
    has_many :likevideos
    has_many :liked_videos, through: :likevideos, source: :video
    
    def is_like_video?(video)
        Likevideo.find_by(user_id: self.id, video_id: video.id).present?
    end
    
    def is_like_news?(news)
        Likenews.find_by(user_id: self.id, news_id: news.id).present?
    end
end
