FROM ruby:2.6.8-slim-stretch AS base

ENV APP_DIR /app
WORKDIR $APP_DIR
