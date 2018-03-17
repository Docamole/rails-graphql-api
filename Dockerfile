FROM alpine:3.7

ENV APP_PATH /rails-graphql-api

RUN apk add --update \
    postgresql-dev \
    alpine-sdk \
    nodejs-npm \
    ruby-dev \
    zlib-dev \
    nodejs \
    ruby \
    curl \
    yarn

# CodeClimate test reporter
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > /usr/bin/cc-test-reporter && \
    chmod 777 /usr/bin/cc-test-reporter

RUN gem install bundler --no-ri --no-rdoc

WORKDIR ${APP_PATH}

COPY Gemfile Gemfile.lock ./
RUN bundle

ADD . .
