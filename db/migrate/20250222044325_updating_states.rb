class UpdatingStates < ActiveRecord::Migration
  def change
    State.where(name: ['Daman and Diu', 'Dadra and Nagar Haveli']).delete_all
    State.find_or_create_by!(name: "Dadra and Nagar Haveli and Daman and Diu")
    State.find_or_create_by!(name: "Telangana")
    State.find_or_create_by!(name: "Ladakh")
  end
end
