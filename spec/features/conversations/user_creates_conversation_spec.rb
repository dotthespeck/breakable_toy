require 'rails_helper'

feature "User creates a message", %q{
  As a user,
  I want to create a conversation,
  so that I can communicate with other users

  Acceptance criteria:
  [x] User must be signed in
  [x] User must be able to create a conversation
} do

  let!(:user){ FactoryGirl.create(:user) }
  let!(:conversation){ FactoryGirl.create(:conversation) }

    scenario "User is not signed in" do
      visit new_conversation_path

      expect(page).to have_content "You need to sign in or sign up before continuing."
    end

    scenario "User creates a conversation" do
      sign_in_as(user)

      visit new_conversation_path
      fill_in 'Post', with: conversation.post
      click_on 'Submit'

      expect(page).to have_content "Post successfully created"
    end

    scenario "User does not have valid input" do
      sign_in_as(user)

      visit new_conversation_path
      fill_in 'Post', with: ""
      click_on 'Submit'

      expect(page).to have_content "Post can't be blank"
      expect(page).to have_content "Post is too short (minimum is 1 character)"
    end
end
