# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com')
    @user.save
    @post = User.first.posts.build
    @post.title = 'This is fist post'
    @post.content = 'a' * 60
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'test if title is empty' do
    @post.title = nil
    assert_not @post.valid?
  end

  test 'title too short' do
    @post.title = 'aa'
    assert_not @post.valid?
  end

  test 'title too long' do
    @post.title = 'a' * 62
    assert_not @post.valid?
  end

  test 'title must be unique' do
    @post.save
    post2 = @post.dup
    assert_not post2.valid?
  end

  test 'test if content is empty' do
    @post.content = nil
    assert_not @post.valid?
  end

  test 'content too short' do
    @post.content = 'aaaa'
    assert_not @post.valid?
  end

  test 'content too long' do
    @post.content = 'a' * 1001
    assert_not @post.valid?
  end
end
