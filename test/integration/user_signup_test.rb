# frozen_string_literal: true

require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test 'user with invalid signup information' do
    get signup_path
    assert_template 'users/new'
    post signup_url params: { user: { name: '' } }
    assert_select 'div#error_explanation'
    assert_template 'users/new'
  end

  test 'User with valid signup information' do
    get signup_path
    assert_template 'users/new'
    post signup_url params: { user: { name: 'Foobar' } }
    user = assigns(:user)
    assert_not flash.empty?
    assert_redirected_to user
    follow_redirect!
    assert is_logged_in?
    assert_template 'users/show'
    assert_select 'div.alert-success'
  end
end
