require 'rails_helper'

feature 'User sees all of the conversations', %q{
  As an authenticated user
  I want to see the conversations
  So that I can communicate with others
  } do
    # Acceptance Criteria
    # [x] I can see all of the conversations on a room page
    # [x] I can see one of the messages for that room
    # [x] I can see who posted the messages

    scenario 'User sees all of the conversations' do

      conversation = FactoryGirl.create(:conversation)
      another_conversation = FactoryGirl.create(:conversation)

      visit conversations_path

      expect(page).to have_content conversation.title
      expect(page).to have_content another_conversation.title
    end

    scenario 'User sees conversations and messages' do
      conversation = FactoryGirl.create(:conversation)
      message = FactoryGirl.create(:message, conversation: conversation)

      visit conversations_path

      expect(page).to have_content conversation.messages.first.post
      expect(page).to have_content conversation.messages.first.user.user_name
      expect(page).to have_content conversation.messages.first.created_at.strftime("%b %e, %l:%M %p")
    end
  end
