require 'rails_helper'

feature 'User sees a conversation', %Q{
  As a user
  I want to see an individual conversation
  So that I can see what others have been saying
  } do
    # Acceptance Criteria
    # [x] I can visit a page for each conversation
    # [] I can see all of the messages from a conversation in chronological order
    # [] I can see who posted the posts and when
    # [] I can see who posted the messages

    scenario 'User sees a conversation' do

      conversation = FactoryGirl.create(:conversation)

      visit conversations_path
      click_on conversation.title

      expect(page).to have_content conversation.title
    end

    scenario 'User sees the messages in a conversation' do
      conversation = FactoryGirl.create(:conversation)
      messages = FactoryGirl.create_list(:message, 5)
    end

end
