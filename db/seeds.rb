# frozen_string_literal: true

require 'faker'

def send_invites(event)
  attendees = User.where('name != :name', name: event.creator.name).sample(5)

  attendees.each do |attendee|
    event.rsvps.create(attendee_id: attendee.id)
  end
end

def respond_to_invites(event)
  event.rsvps.each do |rsvp|
    rsvp.update_column(:accepted, true) if rsvp.id.even?
    rsvp.update_column(:declined, true) if rsvp.id.odd?
  end
end

def set_up_demo
  User.create(name: 'Foo Bar')
  user = User.find_by(name: 'Foo Bar')
  user.events.create(location: 'Beers at my place',
                     date: DateTime.now + 5.days,
                     description: 'Bring some beers.')
  upcoming_events = Event.where('creator_id != :c_id', 
                                c_id: user.id).where('date >= :date', 
                                                      date: DateTime.now).sample(10)
  upcoming_events.each do |event|
    event.rsvps.create(attendee_id: user.id)
  end

  prev_events = Event.where('creator_id != :c_id', 
                            c_id: user.id).where('date < :date', 
                            date: DateTime.now).sample(3)
  prev_events.each do |event|
    event.rsvps.create(attendee_id: user.id, accepted: true)
  end
end

40.times do
  name = Faker::Name.unique.name
  user = User.create(name: name)

  2.times do
    location = Faker::Address.unique.street_address
    date = Faker::Time.backward(90, :evening)
    description = Faker::Lorem.unique.paragraph
    event = user.events.build(location: location,
                              date: date, description: description)
    event.save(validate: false)
  end

  2.times do
    location = Faker::Address.unique.street_address
    date = Faker::Time.forward(90, :evening)
    description = Faker::Lorem.unique.paragraph
    user.events.create(location: location, date: date, description: description)
  end
end

Event.all.each do |event|
  send_invites(event)
  respond_to_invites(event)
end

set_up_demo
