# frozen_string_literal: true

# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'

# require 'capistrano/rails'
# require "whenever/capistrano"
require 'capistrano/bundler'
require 'capistrano/rbenv'
require 'capistrano/puma'
install_plugin Capistrano::Puma
require 'capistrano/puma/nginx' # if you want to upload a nginx site template
require 'capistrano/scm/git'
# require 'capistrano/sidekiq'
# require 'capistrano/shoryuken'
install_plugin Capistrano::SCM::Git
# require 'capistrano/rails/migrations'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
