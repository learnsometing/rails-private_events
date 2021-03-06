# frozen_string_literal: true

require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:rhaenys)
  end

  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { name: '' } }
    assert_not is_logged_in?
    assert_not flash.empty?
    assert_template 'sessions/new'
  end

  test 'login with valid information followed by log out' do
    get login_path
    post login_path, params: { session: { name: @user.name } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_not flash.empty?
    assert_template 'users/show'
    assert_select 'div.alert-success'
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
  end
end
