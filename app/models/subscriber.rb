class Subscriber < ActiveRecord::Base
  validates :phone,:presence => true,
            :numericality => true,
            :length => { :is => 10}

  validates :phone, uniqueness: {message: "Already subscribed"}

  cattr_accessor :message

  scope :subscribed, where('workflow_state = ?', 'subscribed')

end
