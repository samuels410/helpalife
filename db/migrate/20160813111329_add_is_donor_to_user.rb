class AddIsDonorToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_donor, :boolean
  end
end
