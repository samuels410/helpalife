class Need < ActiveRecord::Base
  include FriendlyId
  friendly_id :perma_link,use: [:slugged, :history, :finders]
  belongs_to :user
  belongs_to  :district
  belongs_to :state
  validates :user_id,:required_date,:required_units,:hospital_name,:blood_group,:state_id,:district_id,
            :contact_number,:patient_name,:reason,:perma_link  , presence: true
end
