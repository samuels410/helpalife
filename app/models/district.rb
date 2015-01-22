# == Schema Information
#
# Table name: districts
#
#  id         :integer          not null, primary key
#  state_id   :integer
#  name       :text
#  created_at :datetime
#  updated_at :datetime
#

class District < ActiveRecord::Base
  belongs_to :state
  has_many :users
end
