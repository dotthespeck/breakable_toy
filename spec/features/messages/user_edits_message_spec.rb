require 'rails_helper'

feature 'User edits a message', %Q{
  As an authenticated user
  I want to edit my messages
  So that I can fix any errors in my message
  } do
    # Acceptance Criteria
    # [x] I can edit a message that I created

    scenario 'User edits a message' do
      user = FactoryGirl.create(:user)
      conversation = FactoryGirl.create(:conversation)
      message = FactoryGirl.create(:message, user: user, conversation: conversation)

      sign_in_as(user)
      visit conversation_path(conversation)
      click_on 'Edit'

      within(:css, "div.edit_message") do
        click_button "Edit your message"
      end

      expect(page).to have_content "Message updated"
    end
  end
