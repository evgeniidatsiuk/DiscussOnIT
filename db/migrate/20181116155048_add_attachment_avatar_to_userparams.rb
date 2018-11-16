class AddAttachmentAvatarToUserparams < ActiveRecord::Migration[5.1]
  def self.up
    change_table :userparams do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :userparams, :avatar
  end
end
