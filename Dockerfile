FROM alpine:3.7

ENV APP_PATH /rails-graphql-api

RUN apk update && apk add --update \
    postgresql-dev \
    alpine-sdk \
    ruby-dev \
    ruby-irb \
    zlib-dev \
    curl \
    ruby

RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /usr/bin/cc-test-reporter && \
    chmod 777 /usr/bin/cc-test-reporter

RUN gem install bundler --no-ri --no-rdoc

WORKDIR ${APP_PATH}

COPY Gemfile Gemfile.lock ./
RUN bundle

ADD . .
