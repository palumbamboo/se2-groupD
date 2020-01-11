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
    
* Run the server
    - rails s
    
* Application will start on localhost:3000
    
* Credentials
  In order to use the site we provide multiple credentials for different roles:
  
  | id | username | password | first access | roles |
  |---|---|---|---|---|
  | 1 | u1@p.it | user1pass | no |  both teacher and parent |
  | 2 | u2@p.it | user2pass | yes, password needs to be changed | teacher |
  | 3 | u3@p.it | user3pass | no | teacher |
  | 4 | u4@p.it | user4pass | yes, password needs to be changed | parent |
  | 5 | u5@p.it | user5pass | yes, password needs to be changed | parent |
  | 6 | u6@p.it | user6pass | yes, password needs to be changed | both teacher and parent |
  | 7 | u7@p.it | user7pass | no | officer |
  | 8 | u8@p.it | user8pass | no | administrator |
  | 9 | u9@p.it | user9pass | no | principal |
  | 10 | u10@p.it | user9pass | no | teacher |
  | 11 | u11@p.it | user9pass | no | teacher |
  
  We suggest to access with users 1, 7, 8, 9 since more default data are available for those users.

* How to run the test suite:
    * launch tests with "rails test test/models/nameofclass_test.rb" for model tests
    * launch tests with "rails test/controllers/nameofclass_test.rb" for controller tests

* Docker build instructions:
    - to build the application, you need to go to the config/database.yml file and uncomment the line ```host: db```
    - to build application from scratch run the following commands
        ```
        docker-compose build
        ```
    - after building you need to create and seed the db
        ```
        docker-compose run web bundle exec rake db:create db:migrate
        docker-compose run web bundle exec rake seed:default_data 
        ```
    - to run this application run the command 
        ```
        docker-compose up
        ```

* Docker startup instructions (from Docker Hub):
    - specific docker info can be found inside the public repository: https://hub.docker.com/repository/docker/se2polito/team-d/general

    - pull the **web2** and the **db2** docker images with the following commands:
        ```
        docker pull se2polito/team-d:web2
        docker pull se2polito/team-d:db2
        ```

    - download the **se2polito-team-d-docker-release2.zip** from the link --insert link--
    - unzip it: it should create a folder called "Prova-release2"
    - with your terminal, go inside this directory and launch our application with the command:
        ```
        docker-compose up
        ```
    - container will start on 0.0.0.0:3000
