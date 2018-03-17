Rails.application.routes.draw do
  get '/playground', to: 'static_pages#playground'

  post '/', to: 'graphql#execute'
  root 'graphql#execute'
end
