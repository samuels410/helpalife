# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    name                      "test"
    blood_group               "A1"
    phone_no                  "9876543210"
    u.sequence(:email)        { |n| "test#{n}@email.com" }
    password                  "**********"
    state
    district
  end
end
