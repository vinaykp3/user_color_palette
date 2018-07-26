# README

Steps to be followed to get the application up and running.

Prerequisites:
* Install stable RVM 
* Installed ruby version 2.5.1
* Installed POSTGRES

Steps to be followed to run the application

* Clone the project from the Github
* Inside the project directory Execute following commands
  * ```gem install bundler```
  * Run ```bundle install```
  * Database creation ```rake db:create```
  * Run migrations ```rake db:migrate```
  * Start server ```rails s```
  * Run the test cases ```rspec spec```
