class Organization < ActiveRecord::Base
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
  #:default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  validates :name, 
    presence: { message: "Organization name is mandatory." }

  validates :address, presence: { message: 'Address is mandatory.'}

  validates :description, presence: { message: 'Description is mandatory'}

  validates :state_id, presence: { message: 'Select a state.' }

  validates :district_id, presence: { message: 'Select a District.' }
  
  validates_length_of :name, 
    maximum: 50, too_long: "Maximum 50 characters allowed."

  validates_length_of :address, :description, 
    maximum: 300, too_long: "Maximum 300 characters allowed."

  has_attached_file :banner, styles: { background: '1500X800>'}

  validates_attachment :banner,
    presence: true,
    content_type:  { content_type: ["image/jpeg","image/jpg", "image/gif", "image/png"] }#,
    #size: { in: 0..200.kilobytes }

  has_and_belongs_to_many :users
  belongs_to :state 
  belongs_to :district

  def conected_users
    users 
  end
end