class AddOtpFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :otp_code, :string
    add_column :users, :otp_sent_at, :datetime
  end
end
