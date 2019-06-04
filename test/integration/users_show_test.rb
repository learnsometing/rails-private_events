require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:rhaenys)
  end

  test 'User profile display' do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', @user.name
    assert_select 'h1', text: @user.name + "'s events"
    assert_select 'div.container'
    assert_select 'ul.event_list'
    assert_match @user.events.count.to_s, response.body
  end    
end
