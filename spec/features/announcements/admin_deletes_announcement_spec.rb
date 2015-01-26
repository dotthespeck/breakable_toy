require 'rails_helper'

feature 'Admin deletes an announcement', %q{
  As the creator of an announcement
  I want to delete an announcement
  So that I can reduce clutter with the announcements
  } do

    # Acceptance Criteria
    # [x] The user who created the announcement can delete it

    scenario 'User deletes a conversation' do
      admin = FactoryGirl.create(:admin_user)
      message = FactoryGirl.create(:message, user: admin)

      sign_in_as(admin)
      visit conversations_path
      click_link "Make a new announcement"

      fill_in "Post", with: "Announcement to the world"

      click_button "Submit"
      click_button 'Delete post'

      fill_in 'Post', with: message.post

      click_button "Delete your announcement"

      expect(page).to have_content 'Announcement successfully deleted'
    end
  end
