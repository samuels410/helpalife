
class UpdatingDeletingStates < ActiveRecord::Migration
  def change
    State.where(name: ['Daman and Diu', 'Dadra and Nagar Haveli']).delete_all
    State.where(name: "Dadra and Nagar Haveli and Daman and Diu").first_or_create!
    State.where(name: "Telangana").first_or_create!
    State.where(name: "Ladakh").first_or_create!
  end
end
