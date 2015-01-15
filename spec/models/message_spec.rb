require 'rails_helper'

describe Message do

  describe "#post" do
    it { should have_valid(:post).when("Here is a post", "Posts are good", "123456") }
    it { should_not have_valid(:post).when("abc", nil) }
  end
end
