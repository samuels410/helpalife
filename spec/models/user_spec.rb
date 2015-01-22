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

require 'rails_helper'

RSpec.describe User, :type => :model do
  describe '.search' do
    it "returns a set of users based on conditions given" do
      3.times { create(:user) }
      
    end

  end
end
