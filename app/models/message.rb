class Message < ActiveRecord::Base

  belongs_to :conversation, counter_cache: true
  belongs_to :user

  has_many :hashed_messages
  has_many :hashtags, :through => :hashed_messages

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
      elsif msg.parent_id == nil && msg.conversation_id != nil
        parent << msg
      else
        reply << msg
        counter = msg.parent_id
        @original_message = Message.find(counter)
      end
    end
    #@original_message.reply_count += 1
    return parent
  end

  def tag_strings
    tag_strings = []

    if self.post.include?("#")
      tag_strings << self.post
    end
    tag_strings.map do |tag_string|
      @keyword = tag_string.downcase.match(/(?:#(?!\d+(?:\s|$)))(\w+)(?=\W|$)/i)
      Hashtag.find_or_create_by(hashtag_keyword: @keyword[0])
      @new_hashtag = Hashtag.find_by_hashtag_keyword(@keyword[0])
    end
    return @new_hashtag
  end
end
