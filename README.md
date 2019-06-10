# Rails - Private Events

This [project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations?ref=lnav) is an exercise in creating ActiveRecord associations in rails. Previously we haven't modeled any many-to-many relationships or strayed away from rails naming defaults.

[View on heroku](https://learnsometing-private-events.herokuapp.com/)

OR

Follow the directions under `Getting Started` to get a local copy up and running.

## Features

For the purpose of this project, all users are friends with each other. In addition, authorization and authentication have not been put in place for this project.

- While logged out, a user can sign up for an account by entering their name on the home page.
- A user can log in by pressing 'Log in' on the right side of the top navbar. 'Foo Bar' is the demo name. You can also log in by entering any user name you see throughout the project.
- A logged in user can create events and invite others to them. While logged in, navigate to the home page by clicking the site brand ('Hostr').
  - You will be given a form to create an event.
- On the event page, you can invite others to your event by clicking 'Invite your friends!'. This will take you to a page that lists all of your friends. Check the box next to their name if you want to invite them. Hit 'Invite' at the bottom of the page.
- After sending an invitation, a user will have to confirm that they are going by accepting or declining your invitation.
  - If they accept, they will appear on your event's page under the attendees section.
- To view your invitations, press the invitations link in the navigation bar.
  - You will be taken to a page that shows all the events you have been invited to. Click on 'Open Invitation' to view the event.
  - At the bottom of the event page, click 'Going' or 'I can't make it' then click respond to RSVP to the event.
- Browse through previous and upcoming events by using the navigation bar.

## Getting Started

### Requirements:
- Ruby 2.6.1
- Rails 5.2.3

### Installation
- Clone the repo
- run `bundle install` to install all dependencies
- run `rails test` to make sure the tests pass


### Author

Brian Monaccio
