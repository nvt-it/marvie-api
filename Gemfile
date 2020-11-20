source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.4'
# Use mysql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'ridgepole', '0.7.6'
# dotenv to control load environment file
gem 'dotenv', '2.7.2'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# API gem
gem 'active_model_serializers', '0.10.9'
gem 'fast_jsonapi', '1.5'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Authentication
gem 'jwt', '1.5.6'
gem 'simple_command', '0.0.9'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '1.0.3'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker'
  gem 'rswag-specs'
  gem 'rswag-api'
  gem 'rswag-ui'
  gem "capistrano"
  gem "capistrano3-puma"
  gem "capistrano-rails", require: false
  gem "capistrano-bundler", require: false
  gem "capistrano-rvm"
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem 'rubocop', '0.88.0'
  gem 'rubocop-rails', '2.7.1'
  gem 'pry-rails'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Soft destroy
gem 'paranoia', '2.4.1'
gem 'ransack'
gem 'kaminari'
gem 'rswag'
gem 'rspec-rails', '~> 3.5'