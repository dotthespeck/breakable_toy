require 'rails_helper'

feature 'Administator creates an announcement', %q{
  As an administrator
  I want to create a new announcement
  So that important information is made available for the organization
  } do
    # Acceptance Criteria
    # [x] As an adminstrator, I can create a new announcement
    # [x] An announcement must be at least 5 characters
    # [x] If I try to create an announcement that does not meet these criteria, I am given an error message
    # [] Only administrators can create an announcement

    scenario 'Administrator creates a new announcement' do
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

    scenario 'Admin tries to leave an announcement that is too short' do
      admin = FactoryGirl.create(:admin_user)
      message = FactoryGirl.create(:message, user: admin)

      sign_in_as(admin)

      visit conversations_path
      click_link "Make a new announcement"

      fill_in "Post", with: "Ugh"

      click_button "Submit"

      expect(page).to have_content "Post is too short (minimum is 5 characters)"
    end

    scenario 'Only administrators can make announcements' do
      user = FactoryGirl.create(:user)

      sign_in_as(user)

      expect(page).to have_no_content "Make a new announcement"
    end
end
