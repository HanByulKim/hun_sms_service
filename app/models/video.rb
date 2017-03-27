class Video < ActiveRecord::Base
    is_impressionable
    
    has_many :likevideos
    has_many :liked_users, through: :likevideos, source: :user
    has_many :commentvideos
end
