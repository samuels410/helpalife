source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
ruby '2.3.4'
gem 'rails', '4.1.2'

# Use sqlite3 as the database for Active Record

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'


  # bundle exec rake doc:rails generates the API under doc/api.

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'bootstrap-sass'
gem 'cancan'
gem 'devise'
gem 'devise_invitable'
gem 'pg', '~> 0.11'
#gem 'mysql2'
gem 'simple_form'

#WYSIWYG editor
gem 'tinymce-rails', '5.6.2.1'

#Impressionist gem for impressions
gem 'impressionist'


group :assets do
  gem 'therubyracer', :platform=>:ruby
end

group :development do
  #gem 'better_errors'
  #gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-rails'
  # gem 'pry-byebug'
  # gem 'byebug'
  gem 'annotate'
  gem 'quiet_assets'
  gem 'faker'
  gem 'foreman'
  gem 'dotenv-rails', '~> 2.1'

end

group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'test-unit'
end

gem "paperclip"
gem 'rolify'

gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'
gem 'omniauth-google-oauth2'
gem 'oauth2'
gem "config"
gem 'bootstrap-datepicker-rails'
gem 'will_paginate'
gem 'meta-tags', '~> 1.6.0'
gem 'delayed_job_active_record'
gem 'friendly_id', '5.2'
gem "daemons"
gem 'doorkeeper'

gem 'roo'

group :deploy do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger', '~> 0.2.1'
  gem 'capistrano3-delayed-job', '~> 1.0'
end
gem 'execjs', '~> 2.8', '>= 2.8.1'
gem "dotenv", "~> 2.8"
