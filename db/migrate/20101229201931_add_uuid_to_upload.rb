class AddUuidToUpload < ActiveRecord::Migration
  def self.up
    add_column :uploads, :uuid, :string
  end

  def self.down
    add_column :uploads, :uuid, :string
  end
end
