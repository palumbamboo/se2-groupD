FROM ruby:2.6.3

RUN apt-get update -qq
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_13.x  | bash -
RUN apt-get -y install nodejs postgresql-client git
RUN npm install -g yarn

# Create application folder
RUN mkdir /studently
# Change to the application's directory
WORKDIR /studently
COPY Gemfile /studently/Gemfile
COPY Gemfile.lock /studently/Gemfile.lock
COPY ./package.json /studently/package.json
COPY ./tmp/db /studently/tmp/db
RUN bundle install
RUN yarn install
# Copy application code
COPY . /studently

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]