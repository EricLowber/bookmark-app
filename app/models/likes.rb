class Likes < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookmarks
  
end
