class Hashtag < ActiveRecord::Base

has_many :messages, through: :hashed_posts
has_many :hashed_posts

validates :hashtag_keyword, uniqueness: true

end
