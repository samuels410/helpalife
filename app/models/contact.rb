# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :text
#  email      :text
#  subject    :text
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  validates :name,:email,:message, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
