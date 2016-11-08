class AddAttachmentImageToBuildings < ActiveRecord::Migration
  def self.up
    change_table :buildings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :buildings, :image
  end
end
