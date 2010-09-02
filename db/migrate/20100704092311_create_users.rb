class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :hashed_password
      t.string :key
      t.string :email
      t.bool :is_admin
      t.string :confirm_by

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
