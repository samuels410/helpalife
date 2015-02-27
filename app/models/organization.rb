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

  has_attached_file :banner, styles: { background: '1500X800>',thumb: '338x120#'}

  validates_attachment :banner,
    #presence: true,
    content_type:  { content_type: ["image/jpeg","image/jpg", "image/gif", "image/png"] }
    #size: { in: 0..200.kilobytes }

  belongs_to :user
  has_and_belongs_to_many :users
  belongs_to :state 
  belongs_to :district

  def conected_users
    users 
  end

  #Description: Following mehtod will dump dummy organizations to the table.
  def self.load!(count = 1)
    count.times do 
      Organization.create!(organization_params)
    end
  end

  # Description: Method will prepare the dummy organization params.
  def self.organization_params
    state = State.all.sample
    district = state.districts.sample
    params = {
      name: Faker::Company.name, 
      address: Faker::Address.street_name, 
      description: Faker::Lorem.sentences.join(' '),
      state_id: state.id, 
      district_id: district.id 
    }
  end

end