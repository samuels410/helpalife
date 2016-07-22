class CreateCollegeEmails < ActiveRecord::Migration
  def change
    create_table :college_emails do |t|
      t.string :emails

      t.timestamps
    end
  end
end
