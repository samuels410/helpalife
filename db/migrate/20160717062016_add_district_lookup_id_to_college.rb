class AddDistrictLookupIdToCollege < ActiveRecord::Migration
  def change
    add_column :colleges, :district_lookup_id, :integer
  end
end
