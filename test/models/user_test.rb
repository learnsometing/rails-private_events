require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Foobar')
  end

  test 'User with valid name is valid' do
    assert @user.valid?
  end

  test 'User with no name should be invalid' do
    @user.name = ''
    assert @user.invalid?
  end

  test 'User with name that is too short should be invalid' do
    @user.name = 'a' * 5
    assert @user.invalid?
  end

  test 'User with name that is too long should be invalid' do
    @user.name = 'a' * 141
    assert @user.invalid?
  end
end
