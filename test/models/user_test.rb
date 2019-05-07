require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the user email" do
    user = User.new(email: 'email@example.com')
    assert_equal 'email@example.com', user.email 
  end
end
