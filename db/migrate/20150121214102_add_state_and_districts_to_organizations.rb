class AddStateAndDistrictsToOrganizations < ActiveRecord::Migration
  def change
    add_reference :organizations, :state, index: true
    add_reference :organizations, :district, index: true
  end
end
