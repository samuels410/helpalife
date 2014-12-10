# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
require 'csv'

puts 'CREATING ROLES'
Role.create!([
                { :name => 'admin' },
                { :name => 'donor' },
                { :name => 'volunteer' },
                {:name => 'journalist'}
             ])
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Administrator',
                    :email => 'admin@indiandoners.org',
                    :password => 'Admin123$',
                    :password_confirmation => 'Admin123$',
                    :state_id => 31,
                    :blood_group => "A1+",
                    :district_id =>31,
                    :phone_no => 9629171382

puts 'User created: ' << user.name

user.add_role :admin


puts "Importing states..."
CSV.foreach(Rails.root.join("indian_states.csv"), headers: true) do |row|
  State.create! do |state|
    state.id = row[0]
    state.name = row[1]
  end
end

puts "Importing districts..."
CSV.foreach(Rails.root.join("indian_states_cities.csv"), headers: true) do |row|
  District.create! do |district|
    district.state_id = row[0].to_i
    district.name = row[1]
  end
end


