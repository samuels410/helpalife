# config valid only for current version of Capistrano
lock '3.6.0'

# Define the name of the application
set :application, 'helpalife'

# Define where can Capistrano access the source repository
# set :repo_url, 'https://github.com/[user name]/[application name].git'
set :scm, :git
set :repo_url, 'https://github.com/samuels410/helpalife.git'
set :branch, "deploy"
set :user, "magicbar"
set :use_sudo, true
set :keep_releases, 5
set :rails_env, "production"
set :deploy_via, :copy
# Define where to put your application code
set :deploy_to, "/var/deploy/capistrano/helpalife/"

set :linked_files, %w{config/database.yml config/settings/production.yml}
set :linked_dirs, %w{public/system}


set :pty, true

set :format, :pretty



# Set the post-deployment instructions here.
# Once the deployment is complete, Capistrano
# will begin performing them as described.
# To learn more about creating tasks,
# check out:
# http://capistranorb.com/

# namespace: deploy do

#   desc 'Restart application'
#   task :restart do
#     on roles(:app), in: :sequence, wait: 5 do
#       # Your restart mechanism here, for example:
#       execute :touch, release_path.join('tmp/restart.txt')
#     end
#   end

#   after :publishing, :restart

#   after :restart, :clear_cache do
#     on roles(:web), in: :groups, limit: 3, wait: 10 do
#       # Here we can do anything such as:
#       # within release_path do
#       #   execute :rake, 'cache:clear'
#       # end
#     end
#   end

# end