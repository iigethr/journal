# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Ruby version
ruby "2.6.2"

# See https://github.com/rails/execjs#readme for more supported runtimes
gem "mini_racer", platforms: :ruby

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
# gem "rails", "~> 5.2.2"
gem "rails", "6.0.0.rc1"
# Use postgresql as the database for Active Record
gem "pg", ">= 1.0", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 3.12"

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5.2"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.8"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use ActiveStorage variant
gem "aws-sdk-s3", require: false
gem "image_processing"
gem "mini_magick"

# Use ActiveModel has_secure_password.
gem "bcrypt", "~> 3.1"
# Flexible authentication solution for Rails with Warden.
gem "devise", "~> 4.6", ">= 4.6.2"
# gem "devise", github: "plataformatec/devise", branch: "master"

# Use webpack to manage app-like JavaScript modules in Rails
gem "webpacker", "~> 4.0"
# Rack-based asset packaging system.
gem "sprockets"
# Haml (HTML Abstraction Markup Language) is a layer on top of HTML or XML.
gem "haml", "~> 5.0"
gem "haml-rails", "~> 2.0"
# Use SCSS for stylesheets
gem "sassc-rails", "~> 2.1"

# Load Mies
gem "mies", "0.0.1.alpha", github: "iigethr/mies"
# gem "mies", "0.0.1.alpha", path: "/Users/tonydefaria/Box Sync/iigethr/gems/mies"

# Presenting names of people in full, familiar, abbreviated, and initialized forms.
gem "name_of_person", "~> 1.0"

# Skylight is a smart profiler for Rails, Sinatra, and other Ruby apps.
gem "skylight"

# ActiveModel::Serializers allows you to generate your JSON in an object-oriented and convention-driven manner.
# gem "active_model_serializers", "~> 0.10"

# JSON API(jsonapi.org) serializer that works with rails and can be used to serialize any kind of ruby objects
# gem "fast_jsonapi", "~> 1.5"

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  # Rspec suite
  gem "capybara", "~> 3.21"
  gem "factory_bot_rails", "~> 5.0", ">= 5.0.2"
  # gem "rspec-rails", "~> 4.0"
  gem "rspec-rails", "~> 4.0.0.beta2"
  # gem "rspec-rails", git: "https://github.com/rspec/rspec-rails", branch: "4-0-dev"
  # Continuous Integration
  gem "codeclimate-test-reporter", "~> 1.0", ">= 1.0.9"
  gem "travis", "~> 1.8", ">= 1.8.10"
end

group :development do
  # Kill N+1 queries and unused eager loading.
  gem "bullet", "~> 6.0"
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "chromedriver-helper"
  gem "database_cleaner", "~> 1.7"
  gem "faker", github: "stympy/faker", branch: "master"
  gem "selenium-webdriver"
  gem "shoulda-matchers", "~> 4.0"
  gem "simplecov", require: false
end

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "libv8"
# Linters
gem "coffeelint", require: false
gem "haml_lint", require: false
gem "reek", require: false
gem "rubocop", require: false
gem "rubocop-performance"
gem "scss_lint", require: false
