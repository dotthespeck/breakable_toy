class Hashtag < ActiveRecord::Base

has_many :hashed_messages
has_many :messages, :through => :hashed_messages

validates :hashtag_keyword, uniqueness: true

end
