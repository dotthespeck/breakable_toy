require 'rails_helper'

feature 'User sees a conversation', %q{
  As a user
  I want to see an individual conversation
  So that I can see what others have been saying
  } do
    # Acceptance Criteria
    # [x] I can visit a page for each conversation
    # [x] I can see all of the messages from a conversation in chronological order
    # [x] I can see who posted the posts and when

    scenario 'User sees a conversation' do

      conversation = FactoryGirl.create(:conversation)

      visit conversations_path
      click_on conversation.title

      expect(page).to have_content conversation.title
    end

    scenario 'User sees the messages in a conversation' do
      conversation = FactoryGirl.create(:conversation)
      messages = FactoryGirl.create_list(:message, 5, conversation: conversation)

      visit conversation_path(conversation)

      messages.each do |message|
        expect(page).to have_content message.post
        expect(page).to have_content message.user.user_name
        expect(page).to have_content message.created_at.strftime("%b %e, %l:%M %p")
      end
    end
end
