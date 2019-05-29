# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def is_logged_in?
    !session[:name].nil?
  end

  def log_in_as(user)
    session[:name] = user.name
  end

end

class ActionDispatch::IntegrationTest
  # Log in as a particular user.
  def log_in_as(user)
    post login_path, params: { session: { name: user.name } }
  end
end
