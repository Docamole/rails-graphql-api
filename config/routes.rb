Rails.application.routes.draw do
  post '/', to: 'graphql#execute'
  root 'graphql#execute'
end
