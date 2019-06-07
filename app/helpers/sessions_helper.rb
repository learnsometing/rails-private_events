module SessionsHelper

  # 'Log in' the user by storing their name in the sessions.
  def log_in(user)
    session[:name] = user.name
  end

  # Sets the current user using the sessions or returns the existing current user.
  def current_user
    if (name = session[:name])
      @current_user ||= User.find_by(name: name)
    end
  end

  # Checks if a given user is the currently logged in user.
  def current_user?(user)
    user == current_user
  end

  # Checks to see if any users are logged in.
  def logged_in?
    !current_user.nil?
  end

  # Clear the session.
  def log_out
    session.delete(:name)
    @current_user = nil
  end
end
