class Post < ActiveRecord::Base

  validates :title, :text, presence: true

  scope :newest, -> { order('created_at desc') }
end
