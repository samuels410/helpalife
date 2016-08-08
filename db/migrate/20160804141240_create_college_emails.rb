class CreateCollegeEmails < ActiveRecord::Migration
  def change
    create_table :college_emails do |t|
      t.string :emails
      t.integer :college_id

      t.timestamps
    end
  end
end
