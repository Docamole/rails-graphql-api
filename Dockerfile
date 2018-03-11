FROM ruby:2.5.0

ENV APP_PATH /rails-graphql-api

RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    apt-utils \
    libpq-dev \
    nodejs

WORKDIR ${APP_PATH}

COPY Gemfile Gemfile.lock ./
RUN bundle install

ADD . .


# FROM alpine:3.7
#
# ENV APP_PATH /rails-graphql-api
#
# RUN apk add --update \
#     postgresql-dev \
#     alpine-sdk \
#     ruby-dev \
#     zlib-dev \
#     ruby
#
# RUN gem install bundler --no-ri --no-rdoc
#
# WORKDIR ${APP_PATH}
#
# COPY Gemfile Gemfile.lock ./
# RUN bundle
#
# ADD . .
