class AddCheckedByToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :checked_by, :string
  end

  def self.down
    remove_column :posts, :checked_by
  end
end
