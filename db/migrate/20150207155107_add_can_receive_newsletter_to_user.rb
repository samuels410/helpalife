class AddCanReceiveNewsletterToUser < ActiveRecord::Migration
  def change
    add_column :users, :can_receive_newsletter, :boolean ,default: true
  end
end
