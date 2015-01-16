require 'rails_helper'

feature 'User deletes a message', %Q{
  As the creator of a message
  I want to delete a message
  So that I can get rid of messages I don't want
  } do
    # Acceptance Criteria
    # [x] The user who created the conversation can delete it

    scenario 'User deletes a message' do
      user = FactoryGirl.create(:user)
      conversation = FactoryGirl.create(:conversation, user: user)
      message = FactoryGirl.create(:message, user: user, conversation: conversation)

      sign_in_as(user)
      visit conversation_path(conversation)

      click_on 'Delete post'
save_and_open_page
      click_on 'Delete post'

      expect(page).to have_content 'Message successfully deleted'
    end
  end
