require 'rails_helper'

describe Conversation do

  describe "#title" do
    it { should have_valid(:title).when("New conversation", "Let's talk", "123456") }
    it { should_not have_valid(:title).when("ab", nil) }
  end
end
