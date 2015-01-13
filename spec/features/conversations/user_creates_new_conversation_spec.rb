require 'rails_helper'

feature 'User creates a new conversation', %Q{
  As an authenticated user
  I want to create a new conversation
  So that I can communicate with others on a topic
  } do
    # Acceptance Criteria
    # [] As an authenticated user, I can create a new conversation
    # [] A conversation must have a unique title of at least 3 characters
    # [] If I try to create a conversation that does not meet these criteria, I am given an error message

    scenario 'User creates a new conversation', focus: true do
      conversation = FactoryGirl.create(:conversation)

      visit conversations_path
      save_and_open_page
      click_link "Start a new conversation"

      fill_in "Title", with: conversation.title

      click_button "Submit"

      expect(page).to have_content "New conversation created"
    end
  end
