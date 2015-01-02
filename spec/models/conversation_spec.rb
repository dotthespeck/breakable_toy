require 'rails_helper'

describe Conversation do
  it { should have_valid(:post).when("This is a legitimate post")}
  it { should_not have_valid(:post).when("",
    "The ArticleTest class defines a test case because it inherits from ActiveSupport::TestCase. ArticleTest thus has all the methods available from ActiveSupport::TestCase. You'll see those methods a little later in this guide.
    Any method defined within a class inherited from Minitest::Test (which is the superclass of ActiveSupport::TestCase) that begins with test_ (case sensitive) is simply called a test. So, test_password and test_valid_password are legal test names and are run automatically when the test case is run.
      Rails adds a test method that takes a test name and a block. It generates a normal Minitest::Unit test with method names prefixed with test_.")}
  end
