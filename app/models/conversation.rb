class Conversation < ActiveRecord::Base

belongs_to :user

validates :post, presence: true, length: { minimum: 1, maximum: 250}
end
