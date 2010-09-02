class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :accepted
      t.integer :wrong_answer
      t.integer :timelimit
      t.integer :memorylimit
      t.integer :score
      t.text :about
      t.date :birthday
#TODO: make activities management      t.text :activities
      t.references :user
      
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
