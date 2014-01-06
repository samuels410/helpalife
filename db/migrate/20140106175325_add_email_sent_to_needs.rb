class AddEmailSentToNeeds < ActiveRecord::Migration
  def change
    add_column :needs, :email_sent, :boolean ,default: false
  end
end
