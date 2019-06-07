# frozen_string_literal: true

require 'faker'

class EventsController < ApplicationController
  before_action :logged_in_user, only: %i[create edit update]
  before_action :correct_user, only: %i[edit update]
  
  def create
    @event = current_user.events.build(event_params)
    if @event&.save
      flash[:success] = 'Event successfully created!'
      redirect_to @event
    else
      render 'static_pages/home'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  # Uses the index template to show either upcoming or previous events.
  # The default is to show upcoming events (most people will be 
  # trying to join events)
  def index
    if params[:events].nil? || params[:events][:type] == 'upcoming'
      @events = Event.upcoming.paginate(page: params[:page])
      @header = 'Upcoming Events'
    else
      @events = Event.prev.paginate(page: params[:page])
      @header = 'Previous Events'
    end
  end

  # When a user is viewing one of their events and chooses to invite friends,
  # they are redirected to Events#edit. The event_id is sent over params,
  # and this function stores it in the sessions cookie so an event creator can
  # access it when inviting friends. Then the event and all users other than the 
  # current user (creator) are pulled from the DB and sent to the view.
  def edit
    session[:event_id] = params[:id]
    @event = Event.find(params[:id])
    @users = User.where('id != ?', current_user.id)
  end

  # Access the event using the id stored in sessions, then get the user ids sent
  # in the patch request from the event invitations view. An rsvp is made for 
  # each of the users that were 'invited', using their user id and the event id.
  # The default status of an invitation(rsvp) is not accepted and not declined.
  def update
    event_id = session[:event_id]
    event = Event.find(event_id)
    ids = params[:event][:attendee_ids]
    ids.each do |id|
      next if Rsvp.exists?(attended_event_id: event_id, attendee_id: id)

      event.rsvps.create(attendee_id: id)
    end
    redirect_to event
  end

  private

  def event_params
    params.require(:event).permit(:location, :date, :description)
  end

  def correct_user
    @event = Event.find(params[:id])
    @creator = User.find(@event.creator_id)
    redirect_to(root_url) unless current_user?(@creator)
  end
end
