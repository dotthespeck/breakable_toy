require 'factory_girl'

FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:user_name) { |n| "marlon#{n}dog" }
    password 'password'
    password_confirmation 'password'
  end

  factory :admin_user, parent: :user do
    role 'admin'
  end

  factory :conversation do
    sequence(:title) { |n| "Chat#{n}Place" }

    user
  end

  factory :message do
    post "Hey there world, life is good"

    user
    conversation
  end

  factory :hashtag_message, parent: :message do
    post "I love #lamp"

    user
    conversation
  end
end
