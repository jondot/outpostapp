class CreateUploads < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string :file
      t.string :checksum

      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
