# frozen_string_literal: true
# #!/usr/bin/env puma
# # frozen_string_literal: true
environment 'production'

return ENV['RAILS_ENV'] != 'production'

directory '/home/root/apps/marvie-api/current'
rackup '/home/root/apps/marvie-api/current/config.ru'

tag ''

pidfile '/home/root/apps/marvie-api/shared/tmp/pids/puma.pid'
state_path '/home/root/apps/marvie-api/shared/tmp/pids/puma.state'
stdout_redirect '/home/root/apps/marvie-api/shared/log/puma_access.log', '/home/root/apps/marvie-api/shared/log/puma_error.log', true

threads 4, 16

bind 'unix:///home/root/apps/marvie-api/shared/tmp/sockets/marvie-api-puma.sock'

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