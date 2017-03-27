class Likenews < ActiveRecord::Base
    belongs_to :user
    belongs_to :news
end
