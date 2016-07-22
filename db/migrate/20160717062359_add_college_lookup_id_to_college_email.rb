class AddCollegeLookupIdToCollegeEmail < ActiveRecord::Migration
  def change
    add_column :college_emails, :college_lookup_id, :integer
  end
end
