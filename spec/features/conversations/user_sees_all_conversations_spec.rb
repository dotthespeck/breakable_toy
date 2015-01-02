feature "User views all posts", %q{

  As a user,
  I want to see all the posts,
  so that I know what conversations are happening

  Acceptance criteria
 [x] I can see all of the posts on the index page
  2) I can see who wrote the posts
  3) Posts are arranged in chronological order
} do

  let!(:user){ FactoryGirl.create(:user) }
  let!(:conversation){ FactoryGirl.create(:conversation) }

  scenario "User sees all of the posts" do
    visit root_path

    expect(page).to have_content conversation.post
  end

  scenario "User sees who posted the post" do
    visit root_path

    expect(page).to have_content conversation.user.user_name
  end

end
