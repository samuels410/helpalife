class District < ActiveRecord::Base
  belongs_to :state
  has_many :users
  has_many :organizations 

  scope :name_list, -> { pluck(:name, :id) }

  
end
