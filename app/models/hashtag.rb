class Hashtag < ActiveRecord::Base

has_many :hashed_posts
has_many :messages, :through => :hashed_posts

validates :hashtag_keyword, uniqueness: true

end
