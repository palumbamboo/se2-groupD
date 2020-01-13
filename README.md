# STUDENTLY README

* Ruby version: 2.6.3

* System dependencies: see Gemfile

* Configuration: 
    - for development: 
    nodejs 13.1, yarn latest, postgres

* To work in local with the application, you need to go to the config/database.yml file and comment the line ```host: db```

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
  
* For testing stories related to the upload of Excel files, some useful files are provided inside the **examples** directory (a specific readme inside that folder is provided).

* For testing stories related to sending an email to the user (creation of internal accounts and enabling access to parents) you need to use MailSpons. You need to ask to be invited to the team. An email will be sent to your email address with indications for creating a MailSpons account. 
MailSpons can be found at the following link: https://mailspons.com/. This happens because we use MailSpons as a SMTP pool, which intercepts the email. So the email does not reach the proper destination. We used MailSpons in order to use fake email for all the users.

* How to run the test suite:
    * launch unit tests with "rails test test/models/nameofclass\_test.rb" for model tests (e.g. for the unit test related to class Student, the file needed is "student\_test.rb")
    * launch tests with "bundle exec rspec spec/controllers/nameofcontroller_spec.rb" for controller tests (e.g. for the controller related to class Student, the file needed is "students\_controller\_spec.rb")

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