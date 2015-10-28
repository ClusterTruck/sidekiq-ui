FROM ruby:2.2.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir -p /app
WORKDIR /app

ADD Gemfile /app/
ADD Gemfile.lock /app/

RUN bundle install

ADD . /app

EXPOSE 8080
CMD [ "unicorn" ]
