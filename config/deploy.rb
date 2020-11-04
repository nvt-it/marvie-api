set :application, "cargo-api"
set :repo_url, "git@github.com:tainvit93/cargo-api.git"

set :pty, true
set :linked_files, %w(.env)
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets public/uploads)
set :keep_releases, 5
set :rvm_type, :system
set :rvm_bin_path,    '/Users/john/.rvm/bin'

set :puma_rackup, -> {File.join(current_path, "config.ru")}
set :puma_state, -> {"#{shared_path}/tmp/pids/puma.state"}
set :puma_pid, -> {"#{shared_path}/tmp/pids/puma.pid"}
set :puma_bind, -> {"unix://#{shared_path}/tmp/sockets/puma.sock"}
set :puma_conf, -> {"#{shared_path}/config/puma.rb"}
set :puma_access_log, -> {"#{release_path}/log/puma_access.log"}
set :puma_error_log, -> {"#{release_path}/log/puma_error.log"}
set :puma_role, :app
# set :puma_env, fetch(:rack_env, fetch(:rails_env, "staging"))
set :puma_threads, [4, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end
  
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end