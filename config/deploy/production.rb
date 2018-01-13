# Define roles, user and IP address of deployment server
# role :name, %{[user]@[IP adde.]}
role :app, %w{sysadmin@163.172.81.180}
role :web, %w{sysadmin@163.172.81.180}
role :db,  %w{sysadmin@163.172.81.180}

# Define server(s)
server '163.172.81.180', user: 'sysadmin', roles: %w{web}

# SSH Options
# See the example commented out section in the file
# for more options.
set :ssh_options, {
                    forward_agent: false,
                    port: 1001,
                    user: 'sysadmin',
                }