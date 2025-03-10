class AddOtpAttemptsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :otp_attempts, :integer
  end
end
