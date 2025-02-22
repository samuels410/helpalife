class UpdatingStates < ActiveRecord::Migration
  def change
    State.where(name: ['Daman and Diu', 'Dadra and Nagar Haveli']).delete_all
    State.first_or_create!(name: "Dadra and Nagar Haveli and Daman and Diu")
    State.first_or_create!(name: "Telangana")
    State.first_or_create!(name: "Ladakh")
  end
end
