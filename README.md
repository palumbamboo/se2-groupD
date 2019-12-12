# STUDENTLY README

* Ruby version: 2.6.3

* System dependencies: see Gemfile

* Configuration: 
    - for development: 
    nodejs 13.1, yarn latest, postgres

* Database creation:
    - rails db:create

* Database initialization:
    - rails db:migrate
    - rake seed:default_data

* How to run the test suite: launch tests with "rails test test/models/nameofclass_test.rb" for model tests, launch tests with "rails test/controllers/nameofclass_test.rb" for controller tests

* Docker build instructions:
    - to build application from scratch run ```docker-compose build```
    - after building you need to create the db, run ``` docker-compose run web rails db:setup```
    - If you want you can seed the db with some valid data, just run ```docker-compose run web rake seed:default_data```

* Docker startup instructions:
    - to start the dockerized rails application run ```docker-compose up```
    - container will start on localhost:3000

