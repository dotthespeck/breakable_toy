require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    sequence(:user_name) {|n| "marlon#{n}dog" }
    password 'password'
    password_confirmation 'password'
  end

  factory :message do
    post "Hey there world, life is good"

    user
  end
end
