class AddAttachmentAccAvatarToAccessories < ActiveRecord::Migration
  def self.up
    change_table :accessories do |t|
      t.attachment :acc_avatar
    end
  end

  def self.down
    remove_attachment :accessories, :acc_avatar
  end
end
