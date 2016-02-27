
#**MakersBnB**
=========

###Authors                                    Details
=======                                       =======

Barry Grubb (barrygrubb)                      Date created: 22/02/2016
Wim Hekkelman (jwhekk)                        Date last updated:
Valentina Monetta (valogopedina)              Makers Academy: Week 6
David Parry (drjparry)
Douglas Rose (douglasrose)

##Specification
=============

Web application that allows users to rent or let spaces for the night

Potential renters request spaces that are listed as being available within their date range

Hosts list their spaces, define when their spaces are free, and choose whether to accept or reject rental requests from other users

Link to web application http: .... .heroku.app

##Visual Instructions:

1) Landing Page. First sign up for an account



2) Once successfully signed in, you are automatically signed in. Congratulations! You can now either browse available spaces and make a rental request or create a new space listing



3) To act as a host, create a new space listing


4) To act as a potential renter, submit a rental request on a space
===========


##Technical Details/Key Learning Points:
=====================================

Database:
-DataMapper (ORM) with PostgresSQL (database management)
-Setting up different Database environments (Development and Testing)
-Rakefile (task automation) to automatically run upgrades and migrations, and a DB cleaner for accurate testing


Built in Ruby:
-For MVP functionality we use Sinatra, a DSL that acts as our router/controller file and simplifies the build process
-For a (..% coverage) we use both Capybara and RSPEC
-We use a Rakefile to automatically run upgrades and migrations, and a DB cleaner to keep testing accurate


Installation:
$ git clone https://
$ bundle install
$ psql
 $ CREATE DATABASE makers_bnb_development;
$ rake auto_migrate
$ rspec
$ rackup

##**User Stories:**
=============

**Headline specifications:**
Any signed-up user can list a new space.
Users can list multiple spaces.
Users should be able to name their space, provide a short description of the
space, and a price per night.
Users should be able to offer a range of dates where their space is available.
Users should be able to update their space.
Any signed-up user can request to hire any space for one night, and this should
be approved by the user that owns that space.
Nights for which a space has already been booked should not be available for
users to book that space.
Until a user has confirmed a booking request, that space can still be booked for
that night.
Users looking to book a space should be able to filter available spaces by date.

**Nice-to-haves:**
Users should receive an email whenever one of the following happens:
They sign up
They create a space
They update a space
A user requests to book their space
They confirm a request
They request to book a space
Their request to book a space is confirmed
Their request to book a space is denied
Users should receive a text message to a provided number whenever one of the
following happens:
A user requests to book their space
Their request to book a space is confirmed
Their request to book a space is denied
Spaces should have locations, and users can order spaces to ‘closest-first'
A ‘chat’ functionality once a space has been booked, allowing users whose
space-booking request has been confirmed to chat with the user that owns that
space
Basic payment implementation though Stripe.
Users should be able to rate Spaces once their request to book a space was
confirmed.