class AddUserToOutpost < ActiveRecord::Migration
  def self.up
    add_column :outposts, :user_id, :integer
  end

  def self.down
    remove_column :outposts, :user_id
  end
end
