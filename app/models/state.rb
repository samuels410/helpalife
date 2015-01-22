# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime
#  updated_at :datetime
#

class State < ActiveRecord::Base
  has_many :districts
  has_many :users
end
