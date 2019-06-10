# frozen_string_literal: true

class UsersController < ApplicationController
  include ApplicationHelper
  before_action :logged_in_user, only: %i[check_invites]
  SQL = 'INNER JOIN events ON events.id = rsvps.attended_event_id'
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
    @rsvps = current_user.rsvps.where(unopened).joins(SQL).order(date: :asc)
    render 'users/rsvps'
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def unopened
    { accepted: false, declined: false }
  end

  def accepted
    { accepted: true, declined: false }
  end

  def declined
    { accepted: true, declined: false }
  end
end
