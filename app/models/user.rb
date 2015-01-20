class User < ActiveRecord::Base
  rolify
  belongs_to :state
  belongs_to :district
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => {:thumb => "75x75#" },
                    :default_url => "user_missing.png"
  has_many :authentication, :dependent => :delete_all
  has_many :needs, :dependent => :delete_all
  has_many :notifications, :dependent => :delete_all

  has_and_belongs_to_many :organizations 
  scope :email_notification_enabled, where('can_send_email = ?', true)
  scope :sms_notification_enabled, where('can_send_sms = ?', true)
  scope :phone_not_empty, where.not('phone_no' => nil)

  #validates_attachment :avatar,
  #                     :content_type => { :content_type => ["image/jpeg","image/jpg", "image/gif", "image/png"] },
  #                     :size => { :in => 0..200.kilobytes }

  validates :name,:blood_group,:state_id,:district_id,:email,:phone_no, presence: true
  validates :terms_of_service, acceptance: { accept: '1' }
  validates :phone_no, length: { is: 10 }, numericality: true

  delegate :name, to: :state, prefix: true, allow_nil: true
  delegate :name, to: :district, prefix: true, allow_nil: true

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
