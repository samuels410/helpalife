# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    u.sequence(:name)         { |n| "test#{n}" }
    blood_group               "A1"
    phone_no                  "9876543210"
    u.sequence(:email)        { |n| "test#{n}@email.com" }
    password                  "**********"
    state
    district
    is_donor                  true
  end
end
