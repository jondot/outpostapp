class AddLocationIdToUpload < ActiveRecord::Migration
  def self.up
    add_column :uploads, :location_id, :integer
  end

  def self.down
    remove_column :uploads, :location_id
  end
end
