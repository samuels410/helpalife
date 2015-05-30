# Define roles, user and IP address of deployment server
# role :name, %{[user]@[IP adde.]}
role :app, %w{alphanumeric@62.210.74.160}
role :web, %w{alphanumeric@62.210.74.160}
role :db,  %w{alphanumeric@62.210.74.160}

# Define server(s)
server '62.210.74.160', user: 'magicbar', roles: %w{web}

# SSH Options
# See the example commented out section in the file
# for more options.
set :ssh_options, {
                    forward_agent: false,
                    port: 1001,
                    user: 'magicbar',
                }