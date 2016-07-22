class AddCollegeLookupIdToCollegeContactDetail < ActiveRecord::Migration
  def change
    add_column :college_contact_details, :college_lookup_id, :integer
  end
end
