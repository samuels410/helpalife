class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.text :name
      t.text :address
      t.string :coordinator

      t.timestamps
    end
  end
end
