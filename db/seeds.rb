# frozen_string_literal: true

require 'faker'

User.create(name: 'Foo Bar')

40.times do
  name = Faker::Name.unique.name
  user = User.create(name: name)

  5.times do
    location = Faker::Address.unique.street_address
    date = Faker::Date.forward(100)
    description = Faker::Lorem.unique.paragraph

    user.events.create(location: location, date: date, description: description)
  end
end
