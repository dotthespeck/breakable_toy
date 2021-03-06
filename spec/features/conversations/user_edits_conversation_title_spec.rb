require 'rails_helper'

feature 'User edits title of a conversation', %q{
  As a user
  I want to edit the title of a conversation
  So that I can more accurately represent what is in it
  } do
    # Acceptance Criteria
    # [x] The user who created the conversation can edit it

    scenario 'User edits the title of a conversation' do
      user = FactoryGirl.create(:user)
      conversation = FactoryGirl.create(:conversation, user: user)

      sign_in_as(user)
      visit conversations_path
      click_on conversation.title

      click_on 'Change title'

      fill_in 'Title', with: conversation.title

      within(:css, "div.edit_conversation") do
        click_button "Edit your conversation"
      end

      expect(page).to have_content 'Conversation successfully updated'
    end
end
