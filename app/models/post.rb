class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, :text, presence: true

  scope :newest, -> { order('created_at desc') }
end
