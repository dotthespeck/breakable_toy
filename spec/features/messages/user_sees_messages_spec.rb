require 'rails_helper'

feature 'User sees a message', %Q{
  As an authenticated user
  I want to see messages in a room
  So that I can communicate with others
  } do
    # Acceptance Criteria
    # [x] I can see all of the messages on a message page
    # [x] I know which user posted a message

    scenario 'User sees all messages' do

      message = FactoryGirl.create(:message)

      visit messages_path

      expect(page).to have_content message.post
      expect(page).to have_content message.user.user_name
    end
end
