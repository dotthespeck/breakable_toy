require 'rails_helper'

feature "User creates a message", %q{
  As a user,
  I want to create a conversation,
  so that I can communicate with other users

  Acceptance criteria:
  1) User must be signed in
  2) User must create a post of at least 1 character and maximum 250 characters
  3) User must receive an error message if the conversation is not created
} do

  let!(:user){ FactoryGirl.create(:user) }
  let!(:conversation){ FactoryGirl.create(:conversation) }

    scenario "User creates a conversation" do
      sign_in_as(user)

      visit new_conversation_path
      fill_in 'Post', with: conversation.conversation
      click_on 'Submit'

      expect(page).to have_content "Post successfully created"
    end
end
