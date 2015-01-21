class Message < ActiveRecord::Base

  belongs_to :conversation, counter_cache: true
  belongs_to :user
  has_many :hashtags, through: :hashed_posts
  has_many :hashed_posts

  has_many :children, class_name: 'Message', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Message', foreign_key: 'parent_id'

  validates :post, length: { minimum: 5 }, presence: true

  def reply!
  self.reply_count += 1
  save!
  if parent
    parent.reply!
    end
  end

  def self.sorted_replies
    reply_frequency = Hash.new(0)
    Message.all.each do |msg|
      if msg.parent_id
        reply_frequency[msg.parent_id] += 1
      end
    end
    reply_frequency.sort_by {|k, v| v}.reverse
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
      hashtag = tag_string.downcase.match(/(?:#(?!\d+(?:\s|$)))(\w+)(?=\s|$)/i)
      Hashtag.find_or_create_by(hashtag_keyword: hashtag)
    end
  end
end
