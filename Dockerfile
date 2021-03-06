FROM ruby:2.6.8-slim-stretch AS base

ENV APP_DIR /app
WORKDIR $APP_DIR

RUN apt update && apt upgrade -y && apt install -y build-essential ca-certificates default-libmysqlclient-dev
RUN gem install bundler -v 2.2.26 --conservative
COPY . .
RUN bundle install
