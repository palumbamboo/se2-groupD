docker-compose build
docker-compose run -u root backend bundle
docker-compose run frontend yarn
docker-compose run backend bundle exec rails db:create
