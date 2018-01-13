class AddLatitudeAndLongitudeToUser < ActiveRecord::Migration
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :geo_state, :string
    add_column :users, :state_code, :string
    add_column :users, :postal_code, :string
    add_column :users, :country, :string
    add_column :users, :country_code, :string
  end
end
