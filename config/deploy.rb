lock "~> 3.11.2"

set :application, "rails_app"
set :repo_url, "git@github.com:truongnv0211/demo_deploy.git"
set :application, "rails_app"

set :deploy_to, "/var/www/#{fetch(:application)}"
# set :nginx_config_name, "#{fetch(:application)}_#{fetch(:stage)}"

set :format, :pretty
set :keep_releases, 5
set :rvm_ruby_version, File.read(".ruby-version").strip

set :linked_files, fetch(:linked_files, []).push(
  "config/database.yml", "config/secrets.yml"
)
set :linked_dirs, fetch(:linked_dirs, []).push(
  "log", "tmp/pids", "tmp/cache", "tmp/sockets",
  "vendor/bundle", "public/system",
  "public/uploads", "public/assets"
)

namespace :deploy do
  after :publishing, "deploy:restart"
  after :finishing, "deploy:cleanup"
end
