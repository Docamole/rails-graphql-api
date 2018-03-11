FROM alpine:3.7

ENV APP_PATH /rails-graphql-api

RUN apk add --update \
    postgresql-dev \
    alpine-sdk \
    ruby-dev \
    zlib-dev \
    ruby \
    curl

RUN gem install bundler --no-ri --no-rdoc

WORKDIR ${APP_PATH}

COPY Gemfile Gemfile.lock ./
RUN bundle

ADD . .
