# frozen_string_literal: true

require 'faker'

User.create(name: 'Foo Bar')

40.times do
  name = Faker::Name.unique.name
  user = User.create(name: name)

  2.times do
    location = Faker::Address.unique.street_address
    date = Faker::Time.backward(90, :evening)
    description = Faker::Lorem.unique.paragraph
    user.events.create(location: location, date: date, description: description)
  end

  2.times do
    location = Faker::Address.unique.street_address
    date = Faker::Time.forward(90, :evening)
    description = Faker::Lorem.unique.paragraph
    user.events.create(location: location, date: date, description: description)
  end
end

events = Event.all

events.each do |event|
  attendees = User.all.sample(5)
  event.attendees = attendees
end
