class AddAttachmentBannerToOrganizations < ActiveRecord::Migration
  def self.up
    change_table :organizations do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :organizations, :banner
  end
end
