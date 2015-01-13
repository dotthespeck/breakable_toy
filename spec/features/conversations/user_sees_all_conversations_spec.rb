require 'rails_helper'

feature 'User sees all of the conversations', %Q{
  As an authenticated user
  I want to see the conversations
  So that I can communicate with others
  } do
    # Acceptance Criteria
    # [] I can see all of the rooms on a room page
    # [] I can see some of the messages for that room
    # [] I can see who posted the messages

    scenario 'User sees all of the conversations' do

      conversation = FactoryGirl.create(:conversation)

      visit conversations_path

      expect(page).to have_content conversation.title
    end
  end
