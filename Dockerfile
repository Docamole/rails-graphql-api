FROM alpine:3.7

ENV APP_PATH /rails-graphql-api

RUN apk add --update \
    postgresql-dev \
    alpine-sdk \
    ruby-dev \
    zlib-dev \
    ruby \
    curl

# Code Climate test reporting
RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ./cc-test-reporter && \
    chmod +x ./cc-test-reporter

RUN gem install bundler --no-ri --no-rdoc

WORKDIR ${APP_PATH}

COPY Gemfile Gemfile.lock ./
RUN bundle

ADD . .
