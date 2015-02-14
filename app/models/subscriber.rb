class Subscriber < ActiveRecord::Base
  validates :phone,:presence => true,
            :numericality => true,
            :length => { :is => 10}

  validates :phone, uniqueness: {message: "Already subscribed"}

end
