class Need < ActiveRecord::Base
  belongs_to :user
  belongs_to  :district
  belongs_to :state
  validates :user_id,:required_date,:required_units,:hospital_name,:blood_group,:state_id,:district_id,
            :contact_number,:patient_name,:reason  , presence: true
end
