class Participant < ActiveRecord::Base
  belongs_to :user

  EVENTS = ['Article writing','Poster Design','Photography','Short Film']

  has_attached_file :attachment
  validates_attachment :attachment,
                       :content_type => { :content_type => ["image/jpeg","image/jpg", "image/gif", "image/png" ,"application/pdf"] },
                       :size => { :in => 0..200.megabytes }

end
