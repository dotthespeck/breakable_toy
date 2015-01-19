class Message < ActiveRecord::Base

  belongs_to :conversation, counter_cache: true
  belongs_to :user

  validates :post, length: { minimum: 5 }, presence: true

  def self.sorted_replies
    reply_frequency = Hash.new(0)
    Message.all.each do |msg|
      if msg.parent_id
        reply_frequency[msg.parent_id] += 1
      end
    end
    reply_frequency.sort_by {|k, v| v}.reverse
  end
end
