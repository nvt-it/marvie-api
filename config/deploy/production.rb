server "123.30.234.204", user: "root", roles: %w(web app db), primary: true

set :stage, :production
set :rails_env, :production
set :deploy_to, "/home/root/apps/cargo-api"
set :branch, 'master'