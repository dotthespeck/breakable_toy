class Message < ActiveRecord::Base

  belongs_to :room
  belongs_to :user

  validates :post, length: { minimum: 5 }, presence: true
end
