class AddPermaLinkToNeeds < ActiveRecord::Migration
  def change
    add_column :needs, :perma_link, :text
  end
end
