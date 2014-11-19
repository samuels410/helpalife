class AddRefIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :ref_id, :text
  end
end
