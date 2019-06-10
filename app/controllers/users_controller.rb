# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[check_invites]
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

  # Allows a user to see all of the invitations they have not responded to.
  def check_invites
    @invites = current_user.rsvps.where({ accepted: false, declined: false })
    render 'users/invites', invites: @invites
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
