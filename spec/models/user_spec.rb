require 'rails_helper'

RSpec.describe User, :type => :model do
  describe '.search' do
    it "returns a set of users based on conditions given" do
      size = User::BLOOD_GROUPS.count
      3.times { create(:user) }
      user = User.first
      users = User.all
      params = { blood_group: user.blood_group, state_id: user.state_id, district_id: user.district_id }

      expect(User.search(params)).to eq [user]

      params = { blood_group: user.blood_group, state_id: '', district_id: '' }
      expect(User.search(params)).to eq [users.first, users.second, users.last]
    end

  end
end
