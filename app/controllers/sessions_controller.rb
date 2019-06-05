# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:session][:name])

    if @user
      log_in(@user)
      flash[:success] = 'Log in successful.'
      redirect_to @user
    else
      flash.now[:danger] = 'The user id you entered does not exist.'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
