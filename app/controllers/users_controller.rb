# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user&.save
      log_in(@user)
      flash[:success] = 'Sign up successful'
      redirect_to @user
    else
      render 'users/new'
    end
  end

  def show
    @user = User.find(params[:id])
    @events = @user.events.paginate(page: params[:page])
    @prev_events = @user.previous_events.paginate(page: params[:page])
    @upcoming = @user.upcoming_events.paginate(page: params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
