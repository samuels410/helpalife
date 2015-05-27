class AddUserIdToOrganizations < ActiveRecord::Migration
  def change
    add_reference :organizations, :user, index: true
  end
end
