class Message < ActiveRecord::Base

  validates :post, length: { minimum: 5 }, presence: true
end
