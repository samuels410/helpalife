# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :text
#  blood_group            :text
#  country_id             :integer
#  state_id               :integer
#  district_id            :integer
#  email                  :text             default(""), not null
#  encrypted_password     :text             default(""), not null
#  avatar_url             :text
#  phone_no               :text
#  phone_no_visibility    :boolean          default(TRUE)
#  reset_password_token   :text
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :text
#  last_sign_in_ip        :text
#  created_at             :datetime
#  updated_at             :datetime
#  can_send_email         :boolean          default(TRUE)
#  can_send_sms           :boolean          default(TRUE)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    name                      "test"
    blood_group               "A1"
    phone_no                  "0404040404"
    u.sequence(:email)        { |n| "test#{n}@email.com" }
    password                  "**********"
    state
    district
  end
end
