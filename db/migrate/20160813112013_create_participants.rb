class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.belongs_to :user
      t.text  :college_name
      t.string  :event_name
      t.timestamps
    end
  end
end
