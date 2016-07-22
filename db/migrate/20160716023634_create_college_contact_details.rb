class CreateCollegeContactDetails < ActiveRecord::Migration
  def change
    create_table :college_contact_details do |t|
      t.string :phone

      t.timestamps
    end
  end
end
