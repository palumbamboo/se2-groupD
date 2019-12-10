FROM ruby:2.6.3

RUN apt-get update -qq
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_13.x  | bash -
RUN apt-get -y install nodejs postgresql-client git
RUN npm install -g yarn

# Create application folder
RUN mkdir /school-app
# Change to the application's directory
WORKDIR /school-app
COPY Gemfile /school-app/Gemfile
COPY Gemfile.lock /school-app/Gemfile.lock
COPY ./package.json /school-app/package.json
COPY ./tmp/db /school-app/tmp/db
RUN bundle install
RUN npm install
RUN yarn install --check-files
# Copy application code
COPY . /school-app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]