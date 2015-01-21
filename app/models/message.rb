class Message < ActiveRecord::Base

  belongs_to :conversation, counter_cache: true
  belongs_to :user

  has_many :hashed_posts
  has_many :hashtags, :through => :hashed_posts

  has_many :replies, class_name: 'Message', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Message'

  validates :post, length: { minimum: 5 }, presence: true

  def self.replies
    reply = []
    parent = []
    announcement = []
    Message.all.each do |msg|
      if msg.conversation_id == nil
        announcement << msg
      elsif msg.parent_id == nil
        parent << msg
      else
        reply << msg
      end
    end
    return [parent, reply]
  end

  def tag_strings
    tag_strings = []

    if self.post.include?("#")
      tag_strings << self.post
    end
    tag_strings
  end

  after_save do
    tag_objects = tag_strings.map do |tag_string|
      @hashtag = tag_string.downcase.match(/(?:#(?!\d+(?:\s|$)))(\w+)(?=\s|$)/i)
      @new_hashtag = Hashtag.find_or_create_by(hashtag_keyword: @hashtag)
      if @new_hashtag.id == nil
        @new_hashtag = Hashtag.find(:hashtag_keyword == @hashtag.hashtag_keyword)
      end
      end
    binding.pry
  end
end
