class AddOtpVerifiedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :otp_verified, :boolean, default: false
  end
end
