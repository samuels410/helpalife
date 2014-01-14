class User < ActiveRecord::Base
  rolify
  belongs_to :state
  belongs_to :district
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"
  has_many :authentication, :dependent => :delete_all
  has_many :needs
  scope :email_notification_enabled, where('can_send_email = ?', true)
  scope :sms_notification_enabled, where('can_send_sms = ?', true)

  validates :name,:blood_group,:state_id,:district_id,:email,:phone_no, presence: true
  validates :terms_of_service, acceptance: { accept: '1' }
  validates :phone_no, length: { is: 10 }, numericality: true

  def apply_omniauth(auth)
    # In previous omniauth, 'user_info' was used in place of 'raw_info'
    self.email    = auth['info']['email']
    self.name     = auth['info']['name']
    self.avatar_url= auth['info']['image']
    self.phone_no    = auth['info']['phone']
    self.phone_no_visibility = true
    require 'bcrypt'
    pepper = nil
    cost = 10
    encrypted_password = ::BCrypt::Password.create("#{Time.now.to_s}#{pepper}", :cost => cost).to_s
    self.encrypted_password = encrypted_password
    # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
    authentication.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end

end
