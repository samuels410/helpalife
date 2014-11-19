class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :notification_type
      t.belongs_to :user
      t.integer :notifier_id
      t.string :context_type
      t.integer :context_id
      t.text :message
      t.string :workflow_state
      t.timestamps
    end
  end
end
