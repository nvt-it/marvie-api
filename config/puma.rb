# frozen_string_literal: true
# #!/usr/bin/env puma
# # frozen_string_literal: true

directory '/home/root/apps/cargo-api/current'
rackup '/home/root/apps/cargo-api/current/config.ru'
environment 'production'

tag ''

pidfile '/home/root/apps/cargo-api/shared/tmp/pids/puma.pid'
state_path '/home/root/apps/cargo-api/shared/tmp/pids/puma.state'
stdout_redirect '/home/root/apps/cargo-api/shared/log/puma_access.log', '/home/root/apps/cargo-api/shared/log/puma_error.log', true

threads 4, 16

bind 'unix:///home/root/apps/cargo-api/shared/tmp/sockets/cargo-api-puma.sock'

workers 0
preload_app!

on_restart do
  puts 'Refreshing Gemfile'
  ENV['BUNDLE_GEMFILE'] = ''
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end