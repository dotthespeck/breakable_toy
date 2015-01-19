require 'rails_helper'

feature 'User replies to a message', %q{
  As an authenticated user
  I want to reply to a message
  So that I can add to the conversation
  } do
    # Acceptance Criteria
    # [x] I can create a reply to a message in the post thread
    # [x] I can see my message in the thread in chronological order

    scenario 'User replies to a message' do
      user = FactoryGirl.create(:user)
      conversation = FactoryGirl.create(:conversation)
      message = FactoryGirl.create(:message, user: user, conversation: conversation)

      sign_in_as(user)
      visit conversation_path(conversation)
      click_link 'Reply to post'

      fill_in 'Post', with: "New reply"
      click_button 'Submit'

      expect(page).to have_content "New reply"
    end

    scenario 'User sees posts in chronological order' do
      user = FactoryGirl.create(:user)
      conversation = FactoryGirl.create(:conversation)
      message1 = FactoryGirl.create(:message, user: user, conversation: conversation, created_at: Time.now - 3.days)
      message2 = FactoryGirl.create(:message, post: "Middle post", user: user, conversation: conversation, parent_id: message1.id, created_at: Time.now - 2.days)
      message3 = FactoryGirl.create(:message, post: "Most recent post", user: user, conversation: conversation, parent_id: message1.id, created_at: Time.now - 1.days)

      sign_in_as(user)

      visit conversation_path(conversation)
      click_link 'Reply to post'

      fill_in 'Post', with: message2.post
      click_button 'Submit'

      visit conversation_path(conversation)
      click_link 'Reply to post'

      fill_in 'Post', with: message3.post
      click_button 'Submit'

      expect(message2.post).to appear_before message3.post
    end
  end
