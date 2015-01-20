namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    99.times do |n|
      name = "user-#{n+1}"
      email = "example-#{n+1}@example.com"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   phone_no: rand.to_s[2..11] ,
                   blood_group: ["A1+","A1-","A2+","A2-", "B+", "B-", "A1B+", "A1B-", "A2B+", "A2B-", "AB+", "AB-", "O+", "O-", "A+", "A-"].sample,
                   country_id: rand(1..350),
                   state_id: rand(1..35),
                   district_id: rand(1..603),
                   phone_no_visibility: [true,false].sample)
    end
  end
end