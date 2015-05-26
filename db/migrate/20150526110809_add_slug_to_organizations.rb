class AddSlugToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :slug, :text
  end
end
