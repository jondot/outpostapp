class AddOutpostIdToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :outpost_id, :integer
  end

  def self.down
    remove_column :locations, :outpost_id
  end
end
