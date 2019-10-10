# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com')
    @user.save
    @post = User.first.posts.build
    @post.title = 'This is fist post'
    @post.content = 'a' * 60
    @post.save
    @comment = Comment.new(user_id: 1, post_id: 1, body: 'a' * 100)
  end

  test 'commnet is too short' do
    @comment.body = 'aaa'
    assert_not @comment.valid?
  end

  test 'comment is too long' do
    @comment.body = 'a' * 201
    assert_not @comment.valid?
  end

  test 'comment is empty' do
    @comment.body = nil
    assert_not @comment.valid?
  end
end
