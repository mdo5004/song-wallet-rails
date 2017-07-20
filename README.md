# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# song-wallet-rails

Users
* Name
* Email
* Secure Password
* have many songs
* have many setlists
* belong to many groups
* have many friends (users)

Songs
* Title
* Artist
* Content
* Key
* belong to many setlists
* belong to many users

Setlists
* Name
* have many songs
* belong to many users

Groups
* Name
* have many members (users)