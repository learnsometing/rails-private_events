# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :logged_in_user, only: %i[new create]

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event&.save
      flash[:success] = 'Event successfully created!'
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:location, :date, :description)
  end
end
