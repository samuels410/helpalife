class State < ActiveRecord::Base
  has_many :districts
  has_many :users
  has_many :organizations

  scope :name_list, -> { pluck(:name, :id) }

  def districts_list
    districts.pluck(:name, :id)
  end

  
end
