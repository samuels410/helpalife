class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :user_id
      t.text :provider
      t.text :uid
      t.text :token
      t.timestamps
    end
  end
end
