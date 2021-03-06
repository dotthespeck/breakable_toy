require 'rails_helper'

feature 'Administator creates an announcement', %q{
  As an administrator
  I want to create a new announcement
  So that important information is made available for the organization
  } do
    # Acceptance Criteria
    # [] As an adminstrator, I can create a new announcement
    # [] An announcement must be at least 5 characters
    # [] If I try to create an announcement that does not meet these criteria, I am given an error message
    # [] Only administrators can create an announcement

    scenario 'User logs in and creates a new conversation' do
      admin = FactoryGirl.create(:admin_user)
      message = FactoryGirl.create(:message, user: admin)

      sign_in_as(admin)

      visit conversations_path
      click_link "Make a new announcement"

      fill_in "Post", with: "Announcement to the world"

      click_button "Submit"

      expect(page).to have_content "New announcement created"
      expect(page).to have_content "Announcement to the world"
    end
end
