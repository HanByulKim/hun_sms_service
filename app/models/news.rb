class News < ActiveRecord::Base
    is_impressionable
    
    has_many :likenews
    has_many :liked_users, through: :likenews, source: :user
    has_many :commentnews
end
