# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :repo_url, 'git@github.com:samuels410/helpalife.git'
set :pty, true
set :linked_files, %w{config/database.yml config/settings/production.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache vendor/bundle public/system public/assets}
set :keep_releases, 5

set :bundle_flags, "--deployment"


set :passenger_roles, :app
set :passenger_restart_runner, :sequence
set :passenger_restart_wait, 5
set :passenger_restart_limit, 2
set :passenger_restart_with_sudo, true
set :passenger_environment_variables, {}
set :passenger_restart_command, 'passenger-config restart-app'
set :passenger_restart_options, -> { "#{deploy_to} --ignore-passenger-not-running" }

# Number of delayed_job workers
# default value: 1

namespace :deploy do

  desc "change permission to passenger_user "
  task :passenger_permission do
    on roles(:web) do
      within "#{release_path}" do
        with rails_env: "#{fetch(:stage)}" do
          sudo "chown -R #{fetch(:passenger_user)} #{release_path}/"
          sudo "chown -R #{fetch(:passenger_user)} #{release_path}/log/"
          sudo "chmod 777 -R #{release_path}/tmp/cache"
        end
      end
    end
  end
end

after :deploy, 'deploy:passenger_permission'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
