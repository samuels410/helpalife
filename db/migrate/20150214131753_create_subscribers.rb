class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string  :phone
      t.string :workflow_state ,default: 'subscribed'
      t.string :subscribed_for
      t.timestamps
    end
  end
end
