class CreateOutposts < ActiveRecord::Migration
  def self.up
    create_table :outposts do |t|
      t.string :nid
      t.integer :size_limit, :default=>0
      t.boolean :notification, :default=>false
      t.integer :rolling, :default=>0
      t.boolean :disabled, :default=>false
      t.string :base_location

      t.timestamps
    end
  end

  def self.down
    drop_table :outposts
  end
end
