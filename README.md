# rails-graphql-api

A basic, minimal, opionated project base for Rails GraphQL APIs

## Requirements

- [Docker CE](https://www.docker.com/community-edition)

## Getting Started

**Clone this repo, copy the environment file example, make any necessary changes**

```bash
git clone https://github.com/docamole/rails-graphql-api.git example-api
cd example-api
cp .env.example .env
nano .env
```

***

**Build the docker container**

```bash
docker-compose build
```

***

**Create the database**

```bash
docker-compose run api rake db:create db:migrate
```

***

**Start the container**

```bash
docker-compose up
```

You should now have a running GraphQL endpoint at [http://localhost:3000](http://localhost:3000)

***

**Stopping the container**

To stop the running container, press `Ctrl+C`, then type `docker-compose stop`

To destroy a container, use `docker-compose down`
