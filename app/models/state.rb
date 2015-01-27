class State < ActiveRecord::Base
  has_many :districts
  has_many :users
end
