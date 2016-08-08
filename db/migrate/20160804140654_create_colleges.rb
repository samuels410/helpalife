class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.text :name
      t.text :address
      t.string :coordinator
      t.integer :district_id

      t.timestamps
    end
  end
end
