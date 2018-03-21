# rails-graphql-api

An opionated project base for Rails GraphQL APIs

[![BuildStatus](https://travis-ci.org/Docamole/rails-graphql-api.svg?branch=master)](https://travis-ci.org/Docamole/rails-graphql-api)
[![Dependency Status](https://gemnasium.com/badges/github.com/Docamole/rails-graphql-api.svg)](https://gemnasium.com/github.com/Docamole/rails-graphql-api)
[![Maintainability](https://api.codeclimate.com/v1/badges/08fcb1975ad2f7871544/maintainability)](https://codeclimate.com/github/Docamole/rails-graphql-api/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/08fcb1975ad2f7871544/test_coverage)](https://codeclimate.com/github/Docamole/rails-graphql-api/test_coverage)
[![Inline docs](http://inch-ci.org/github/docamole/rails-graphql-api.svg?branch=master)](http://inch-ci.org/github/docamole/rails-graphql-api)


## :sparkles: Features

  - Full WebSocket support with AnyCable (including GraphQL subscriptions)
  - Background job scheduling with Resque & Redis
  - JWT Authentication
  - ...and more!


# Development

## :electric_plug: Prerequisites

Install [Docker CE](https://www.docker.com/community-edition).

Below are some handy aliases that will make your life significantly easier, add them to
the appropriate .bashrc, .zshrc, etc. file

It's assumed you'll be using these aliases going forward, if not, reference the
relevant commands here.

```bash
alias dup='docker-compose up'
alias ddown='docker-compose down'
alias drun='docker-compose run'
alias dbuild='docker-compose build'
```


## :octocat: Getting Started

**Clone this repo, copy the environment file example, make any necessary changes**

```bash
git clone https://github.com/docamole/rails-graphql-api.git example-api
cd example-api
cp .env.example .env
# Edit the .env file to suit you
```

***

**Build the docker container**

```bash
dbuild
```

***

**Create the database**

```bash
drun api rake db:create db:migrate
```

## :rocket: Launch & Develop

**Start the container**

```bash
dup
```

You should now have a running GraphQL endpoint at
  - [http://localhost:3000](http://localhost:3000)

You can view jobs at
  - [http://localhost:3000/jobs](http://localhost:3000/jobs)

You can view documentation at
  - [http://localhost:8808](http://localhost:8808) (uncomment `yard` in `Procfile.dev` first)

***

Run commands in the container using `drun api`,
followed by the desired command, here are some common usage examples:

```bash
drun api rails console
drun api rails generate model Widget name:string
drun api rake db:migrate
```

***

** Running tests**

```bash
drun api bundle exec rspec spec --format documentation
```

***

**Stopping the container & Pitfalls**

To stop the running container, press `Ctrl+C`, then type `dstop`

To destroy a container, use `ddown`

If you ever receive an error that the server is already running, try deleting `tmp/pids/server.pid`
before bringing the server back up.
