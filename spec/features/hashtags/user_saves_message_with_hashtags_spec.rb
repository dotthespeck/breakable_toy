require 'rails_helper'

feature 'User saves a message with hashtags', %q{
  As an authenticated user
  I want to create a message with hashtags
  So that it will be easier to retrieve that message and related ones later
  } do
    # Acceptance Criteria
    # [x] I can create a message with a hashtag that saves
    # [x] I can see my message on a page dedicated to the same hashtag

    scenario 'User views messages attached to hashtags' do
      user = FactoryGirl.create(:user)
      conversation = FactoryGirl.create(:conversation)
      message = FactoryGirl.create(:hashtag_message)

      visit new_user_session_path
      sign_in_as(user)
      visit new_conversation_message_path(conversation)
      fill_in 'Post', with: message.post
      click_button 'Submit'

      visit conversations_path

      click_link "#lamp"
      expect(page).to have_content message.post
    end
end
