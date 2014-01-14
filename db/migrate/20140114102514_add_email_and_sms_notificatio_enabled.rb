class AddEmailAndSmsNotificatioEnabled < ActiveRecord::Migration
  def change
    add_column :users, :can_send_email, :boolean ,default: true
    add_column :users, :can_send_sms, :boolean ,default: true
  end
end
