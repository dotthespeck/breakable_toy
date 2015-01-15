class Message < ActiveRecord::Base

  belongs_to :conversation
  belongs_to :user

  validates :post, length: { minimum: 5 }, presence: true
end
