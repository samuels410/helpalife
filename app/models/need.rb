# == Schema Information
#
# Table name: needs
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  blood_group    :string(255)
#  required_date  :date
#  required_units :integer
#  contact_number :text
#  state_id       :integer
#  district_id    :integer
#  hospital_name  :text
#  reason         :text
#  patient_name   :text
#  is_notified    :boolean
#  created_at     :datetime
#  updated_at     :datetime
#  email_sent     :boolean          default(FALSE)
#  slug           :text
#  perma_link     :text
#

class Need < ActiveRecord::Base
  extend FriendlyId
  friendly_id :perma_link,use: [:slugged, :history, :finders]
  belongs_to :user
  belongs_to  :district
  belongs_to :state
  validates :user_id,:required_date,:required_units,:hospital_name,:blood_group,:state_id,:district_id,
            :contact_number,:patient_name,:reason,:perma_link  , presence: true
end
