require 'rails_helper'

feature 'User sees all of the messages', %Q{
  As an authenticated user
  I want to see the rooms
  So that I can communicate with others
  } do
    # Acceptance Criteria
    # [] I can see all of the rooms on a room page
    # [] I can see some of the messages for that room
    # [] I can see who posted the messages

    scenario 'User sees all messages' do

    room = FactoryGirl.create(:room)
    message = FactoryGirl.create(:message, room: room)
binding.pry
      visit rooms_path

      expect(page).to have_content room.title
      expect(page).to have_content room.message.post
      #expect(page).to have_content room.user.user_name
    end
  end
