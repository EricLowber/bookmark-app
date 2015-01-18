class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topics
  has_many :likes
  
end