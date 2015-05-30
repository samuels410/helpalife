class Post < ActiveRecord::Base
  is_impressionable

  extend FriendlyId
  friendly_id :title,use: [:slugged, :history, :finders]

  belongs_to :user

  validates :title, :text, presence: true

  scope :newest,    -> { order('created_at desc') }
  scope :published, -> { where(is_published: :true) }
end
