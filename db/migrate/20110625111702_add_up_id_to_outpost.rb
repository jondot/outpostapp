class AddUpIdToOutpost < ActiveRecord::Migration
  def self.up
    add_column :outposts, :uuid, :string
  end

  def self.down
    add_column :outposts, :uuid, :string
  end
end
