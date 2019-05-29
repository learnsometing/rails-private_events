module SessionsHelper
  def log_in(user)
    session[:name] = user.name
  end
end
