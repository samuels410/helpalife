class AddSlugToNeeds < ActiveRecord::Migration
  def change
    add_column :needs, :slug, :text
    add_index :needs, :slug
  end
end
