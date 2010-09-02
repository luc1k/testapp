class CreateUserpics < ActiveRecord::Migration
  def self.up
    create_table :userpics do |t|
    t.integer :album_id, :parent_id, :size, :width, :height
    t.string :content_type, :filename, :thumbnail
    t.timestamps
    end
  end

  def self.down
    drop_table :userpics
  end
end
