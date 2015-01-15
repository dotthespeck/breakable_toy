class Conversation < ActiveRecord::Base

  has_many :messages, dependent: :destroy
  belongs_to :user

  validates :title, length: { minimum: 3 }, presence: true
end
