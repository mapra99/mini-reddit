# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Example User', email: 'user@example.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name is too short' do
    @user.name = 'aaa'
    assert_not @user.valid?
  end

  test 'name is too long' do
    @user.name = 'a' * 141
    assert_not @user.valid?
  end

  test 'name is empty' do
    @user.name = nil
    assert_not @user.valid?
  end

  test 'Email is empty' do
    @user.email = nil
    assert_not @user.valid?
  end
  test 'Email is to long' do
    @user.email = 'a' * 257 + '@example.com'
    assert_not @user.valid?
  end
  test 'Email format' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  test 'Email must be unique' do
    @user.save
    user2 = @user.dup
    assert_not user2.valid?
  end
end
