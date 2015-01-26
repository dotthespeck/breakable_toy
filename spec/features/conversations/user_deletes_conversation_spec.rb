require 'rails_helper'

feature 'User deletes a conversation', %q{
  As the creator of a conversation
  I want to delete a conversation
  So that I can make sure that unused conversations are deleted
  } do
    # Acceptance Criteria
    # [x] The user who created the conversation can delete it

    scenario 'User deletes a conversation' do
      user = FactoryGirl.create(:user)
      conversation = FactoryGirl.create(:conversation, user: user)

      sign_in_as(user)
      visit conversation_path(conversation)

      click_button 'Delete conversation'

      click_button 'Delete conversation'

      expect(page).to have_content 'Conversation successfully deleted'
    end
  end
