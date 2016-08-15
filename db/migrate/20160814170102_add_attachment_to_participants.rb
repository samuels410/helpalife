class AddAttachmentToParticipants < ActiveRecord::Migration
  def change
    add_attachment :participants, :attachment
  end
end
