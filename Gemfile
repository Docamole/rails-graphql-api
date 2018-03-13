source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Server
gem 'rails', '~> 5.1.5'
gem 'puma', '~> 3.7'
gem 'anycable-rails', '~> 0.5.3'

# Database
gem 'pg', '>= 0.18', '< 2.0'

# API
gem 'rack-cors', '~> 1.0', '>= 1.0.2'
gem 'graphql', '~> 1.7', '>= 1.7.13'

# Auth
gem 'jwt', '~> 2.1'

# Required when using alpine ruby
gem 'json', '~> 2.1'
gem 'bigdecimal', '~> 1.3', '>= 1.3.4'
gem 'io-console', '~> 0.4.6'
gem 'redcarpet', '~> 3.4'

group :development, :test do
  # Testing
  gem 'rspec-graphql_matchers', '~> 0.7.1'
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'simplecov', '~> 0.15.1'
  gem 'simplecov-console', '~> 0.4.2'

  # Server
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Utilities
  gem 'foreman', '~> 0.84.0'
  gem 'pattern_generator', '~> 0.1.0'
  gem 'better_errors', '~> 2.4'

  # Documentation (Run `yard server` ~ localhost:8808)
  gem 'rdoc', '~> 6.0', '>= 6.0.1'
  gem 'yard', '~> 0.9.12'
end

gem 'tzinfo-data', '~> 1.2018', '>= 1.2018.3'
