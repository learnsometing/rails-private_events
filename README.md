# Rails - EventBrite Associations Project

This [project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations?ref=lnav) is an exercise in creating data associations through rails. Previously we haven't modeled any many-to-many relationships or strayed away from rails naming defaults.

## Getting Started

### Requirements:
- Ruby 2.6.1
- Rails 5.2.3

### Installation
- Clone the repo
- run `bundle install` to install all dependencies
- run `rails test` to make sure the tests pass

## Features

For the purpose of this project, all users are friends with each other.

- A logged in user can create events and invite others to them. While logged in, navigate to the home page by clicking the site brand ('Hostr').
  - You will be given a form to create an event.
- On the event page, you can invite others to your event by clicking 'Invite your friends!'. This will take you to a page that lists all of your friends. Check the box next to their name if you want to invite them. Hit 'Invite' at the bottom of the page.
- After sending an invitation, a user will have to confirm that they are going by accepting or declining your invitation.
  - If they accept, they will appear on your event's page under the attendees section.
- To view your invitations, press the invitations link in the navigation bar.
  - You will be taken to a page that shows all the events you have been invited to. Click on 'Open Invitation' to view the event.
  - At the bottom of the event page, click 'Going' or 'I can't make it' then click respond to RSVP to the event.
- Browse through previous and upcoming events by using the navigation bar.
### Author

Brian Monaccio
