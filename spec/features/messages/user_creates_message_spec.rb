require 'rails_helper'

feature 'User creates a message', %Q{
  As an authenticated user
  I want to create a message
  So that I can communicate with others
  } do
    # Acceptance Criteria
    # [x] I can create a message on the new message page
    # [x] Messages are at least 5 characters, or else I get an error message
    # [x] If my message is not created, I am given an error message
    # [x] I must be signed in to create a message

    scenario 'User creates a message' do
      user = FactoryGirl.create(:user)

      sign_in_as(user)
      visit new_message_path
      fill_in 'Post', with: "Here is a new message"
      click_button 'Submit'

      expect(page).to have_content "Message saved successfully"
    end

    scenario 'User creates a message that is too short' do
      user = FactoryGirl.create(:user)

      sign_in_as(user)
      visit new_message_path
      fill_in 'Post', with: "Bla"
      click_button 'Submit'

      expect(page).to have_content "Post is too short (minimum is 5 characters)"
      expect(page).to have_content "error(s) prevented the post from being saved"
    end

    scenario "User is not signed in" do

      visit new_message_path
      expect(page).to have_content "You need to sign in or sign up before continuing"
    end

  end
