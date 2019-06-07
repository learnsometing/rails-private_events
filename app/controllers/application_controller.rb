class ApplicationController < ActionController::Base
  include SessionsHelper

  # Checks for a currently logged in user. Used as a before filter
  def logged_in_user
    if !logged_in?
      flash[:danger] = 'You must log in to continue.'
      redirect_to login_url
    end
  end

  
end
