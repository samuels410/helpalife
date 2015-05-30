class AddPermaLinkToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :perma_link, :text
  end
end
