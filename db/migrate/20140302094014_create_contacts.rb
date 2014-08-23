class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.text :name
      t.text :email
      t.text :subject
      t.text :message
      t.timestamps
    end
  end
end
