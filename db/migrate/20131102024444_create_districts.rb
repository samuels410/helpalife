class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.integer :state_id
      t.text :name
      t.timestamps
    end
  end
end
