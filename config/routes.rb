require 'resque/server' if Rails.env.development?

Rails.application.routes.draw do
  if Rails.env.development?
    mount Resque::Server, at: '/jobs'
  end

  post '/', to: 'graphql#execute'
  root 'graphql#execute'
end
