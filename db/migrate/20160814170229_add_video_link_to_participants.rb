class AddVideoLinkToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :video_link, :text
  end
end
