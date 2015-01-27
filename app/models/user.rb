# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :text
#  blood_group            :text
#  country_id             :integer
#  state_id               :integer
#  district_id            :integer
#  email                  :text             default(""), not null
#  encrypted_password     :text             default(""), not null
#  avatar_url             :text
#  phone_no               :text
#  phone_no_visibility    :boolean          default(TRUE)
#  reset_password_token   :text
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :text
#  last_sign_in_ip        :text
#  created_at             :datetime
#  updated_at             :datetime
#  can_send_email         :boolean          default(TRUE)
#  can_send_sms           :boolean          default(TRUE)
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ActiveRecord::Base
  rolify

  # Associations
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

  # Scopes
  scope :email_notification_enabled, where('can_send_email = ?', true)
  scope :sms_notification_enabled, where('can_send_sms = ?', true)
  scope :phone_not_empty, where.not('phone_no' => nil)

  # Validations
  validates_attachment :avatar,
                       :content_type => { :content_type => ["image/jpeg","image/jpg", "image/gif", "image/png"] },
                       :size => { :in => 0..200.kilobytes }

  validates :name,:blood_group,:state_id,:district_id,:email,:phone_no, presence: true
  validates :terms_of_service, acceptance: { accept: '1' }
  validates :phone_no, length: { is: 10 }, numericality: true

  # Constants
  BLOOD_GROUPS = %w(A1+ A1- A2+ A2- B+ B- A1B+ A1B- A2B+ A2B- AB+ AB- O+ O- A+ A-)

  def self.search(params)
    users = User.where nil

    params.each do |k, v|
      users = users.where(k => v) if v.present?
    end

    users
  end

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

  private

  def self.condition_builder(params)

  end


end
