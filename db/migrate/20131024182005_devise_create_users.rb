class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.text :name
      t.text :blood_group
      t.integer  :country_id
      t.integer :state_id
      t.integer :district_id
      t.text :email,              :null => false, :default => ""
      t.text :encrypted_password, :null => false, :default => ""
      t.text :avatar_url
      t.text :phone_no
      t.boolean :phone_no_visibility ,:default =>true
      ## Recoverable
      t.text   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.text   :current_sign_in_ip
      t.text   :last_sign_in_ip

      ## Confirmable
      # t.text   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.text   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.text   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end
end
