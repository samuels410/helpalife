class CreateNeeds < ActiveRecord::Migration
  def change
    create_table :needs do |t|
      t.integer :user_id
      t.string :blood_group
      t.date     :required_date
      t.integer  :required_units
      t.text :contact_number
      t.integer  :state_id
      t.integer :district_id
      t.text :hospital_name
      t.text :reason
      t.text :patient_name
      t.boolean :is_notified
      t.timestamps
    end
  end
end
