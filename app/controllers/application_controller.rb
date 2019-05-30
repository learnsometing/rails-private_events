class ApplicationController < ActionController::Base
  include SessionsHelper

  def logged_in_user
    if !logged_in?
      flash[:danger] = 'You must log in to continue.'
      redirect_to login_url
    end
  end
end
