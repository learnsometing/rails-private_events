class RsvpsController < ApplicationController
  before_action :logged_in_user, only: %i[edit update]
  before_action :correct_attendee, only: %i[edit update]
  # Pulls the invitation and shows the event information to the user. A user
  # can either accept or decline.
  def edit
    @rsvp = Rsvp.find(params[:id])
    @event = Event.find(@rsvp.attended_event_id)
    @going = @event.attendees.where('accepted AND NOT declined')
    @not_going = @event.attendees.where('NOT accepted AND declined')
  end

  # Update the status of the invitation to either accepted or declined. The edit
  # form uses radio buttons so only one selection can be made at a time.
  def update
    @rsvp = Rsvp.find(params[:id])
    @event = Event.find(@rsvp.attended_event_id)

    if accepted?
      @rsvp.update_column(:accepted, true)
      flash[:success] = 'You are now attending ' + @event.location + '.'
    else
      @rsvp.update_column(:declined, true)
      message = 'You declined the invitation to ' + @event.location + '.'
      flash[:warning] = message
    end

    redirect_to invitations_path
  end

  private

  def accepted?
    params[:rsvp][:accepted] == 'true'
  end

  def correct_attendee
    @rsvp = Rsvp.find(params[:id])
    @attendee = User.find(@rsvp.attendee_id)
    redirect_to root_url unless current_user?(@attendee)
  end
end
