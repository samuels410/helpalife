class AddOtpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :otp, :string

  end
end
