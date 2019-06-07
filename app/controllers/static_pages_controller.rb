# frozen_string_literal: true

class StaticPagesController < ApplicationController
  # Since the home page serves as the event creation page if a user is logged in
  # we need an event to send to the view.
  def home
    @event = current_user.events.build if logged_in?
  end
end
