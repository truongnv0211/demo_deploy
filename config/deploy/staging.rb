ask :brach, "master"
set :git
set :stage, :staging
set :rails_env, :staging
set :user, "deploy"

set :ssh_options, port: 2222, forward_agent: true

server "127.0.0.1", user: "deploy", roles: %(app db web)
