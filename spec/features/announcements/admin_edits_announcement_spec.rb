require 'rails_helper'

feature 'Admin edits an announcement', %q{
  As an admin
  I want to edit the title of an announcement that I created
  So that I can change details if necessary
  } do
    # Acceptance Criteria
    # [x] The admin who created the announcement can edit it

    scenario 'Admin edits an announcement' do
      admin = FactoryGirl.create(:admin_user)
      message = FactoryGirl.create(:message, user: admin)

      sign_in_as(admin)
      visit conversations_path
      click_link "Make a new announcement"

      fill_in "Post", with: "Announcement to the world"

      click_button "Submit"
      click_button 'Edit post'

      fill_in 'Post', with: message.post

      within(:css, "div.edit_announcement") do
        click_button "Edit your announcement"
      end

      expect(page).to have_content 'Announcement successfully updated'
    end
  end
