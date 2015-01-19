require 'rails_helper'

feature 'User creates a new conversation', %q{
  As an authenticated user
  I want to create a new conversation
  So that I can communicate with others on a topic
  } do
    # Acceptance Criteria
    # [x] As an authenticated user, I can create a new conversation
    # [x] A conversation must have a unique title of at least 3 characters
    # [x] If I try to create a conversation that does not meet these criteria, I am given an error message

    scenario 'User logs in and creates a new conversation' do
      user = FactoryGirl.create(:user)
      conversation = FactoryGirl.create(:conversation, user: user)

      sign_in_as(user)

      visit conversations_path
      click_link "Start a new conversation"

      fill_in "Title", with: conversation.title

      click_button "Submit"

      expect(page).to have_content "New conversation created"
    end

    scenario 'User tries to create invalid conversation' do
      user = FactoryGirl.create(:user)
      conversation = FactoryGirl.create(:conversation, user: user)

      sign_in_as(user)

      visit conversations_path
      click_link "Start a new conversation"

      fill_in "Title", with: ""

      click_button "Submit"

      expect(page).to have_content "Title is too short (minimum is 3 characters)"
    end

    scenario 'Unauthorized user tries to create a conversation' do
      visit conversations_path
      click_link "Start a new conversation"

      expect(page).to have_content "You need to sign in or sign up before continuing"
    end
  end
