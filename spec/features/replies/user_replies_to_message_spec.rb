require 'rails_helper'

feature 'User replies to a message', %Q{
  As an authenticated user
  I want to reply to a message
  So that I can add to the conversation
  } do
    # Acceptance Criteria
    # [x] I can create a reply to a message in the post thread
    # [] I can see my message in the thread in chronological order

    scenario 'User replies to a message' do
      user = FactoryGirl.create(:user)
      conversation = FactoryGirl.create(:conversation)
      message = FactoryGirl.create(:message, user: user, conversation: conversation)

      sign_in_as(user)
      visit conversation_path(conversation)
      click_link 'Reply to post'

      fill_in 'Post', with: "New reply"
      click_button 'Submit'

      expect(page).to have_content "New reply"
    end
  end
