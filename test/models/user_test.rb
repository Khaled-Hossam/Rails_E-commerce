require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'invalid without email' do
    user = User.new()
    assert_not_nil user.errors[:email]
  end

  test "the user email" do
    user = User.new(email: 'email@example.com')
    assert_equal 'email@example.com', user.email 
  end
end
