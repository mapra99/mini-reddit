require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name is too short" do
    @user.name = "aaa"
    assert_not @user.valid?
  end

  test "name is too long" do
    @user.name = "a"*141
    assert_not @user.valid?
  end

  test "name is empty" do
    @user.name = nil
    assert_not @user.valid?
  end
end
