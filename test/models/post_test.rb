require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
    @user.save
    @post = User.first.posts.build
    @post.title = "This is fist post"
    @post.content = "a"* 60
  end
  
  test "should be valid" do
    assert @post.valid?
  end

  test "test if title is empty" do
    @post.title = nil
    assert_not @post.valid?
  end

  test "title too short" do
    @post.title = "aa"
    assert_not @post.valid?
  end

  test "title too long" do
    @post.title = "a"*1001
    assert_not @post.valid?
  end

  test "title must be unique" do
    @post.save
    post2 = @post.dup
    assert_not post2.valid?
  end
end
