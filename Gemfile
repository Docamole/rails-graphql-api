source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Server
gem 'rails', '~> 5.1.5'
gem 'puma', '~> 3.7'

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

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'pattern_generator', '~> 0.1.0'
  gem 'better_errors', '~> 2.4'
end

gem 'tzinfo-data', '~> 1.2018', '>= 1.2018.3'
