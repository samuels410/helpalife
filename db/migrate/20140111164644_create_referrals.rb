class CreateReferrals < ActiveRecord::Migration
  def change
    create_table :referrals do |t|

      t.timestamps
    end
  end
end
