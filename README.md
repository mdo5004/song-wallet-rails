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
* Username
* Email
* Secure Password
[x] have many songs
[x] have many setlists
[x] belong to many groups
[x] have many friends (users)

Songs
* Title
* Artist
* Content
* Key
[x] belong to many setlists
[x] belong to many users

Setlists
* Name
* have many songs
[x] belong to many users

Groups
* Name
[x] have many members (users)

Join tables:
[x] UserSong
[x] UserSetlist
[x] UserGroup
[x] UserFriend
[x] SongSetlist