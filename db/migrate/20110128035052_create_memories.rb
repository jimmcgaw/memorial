require 'migration_helpers'

class CreateMemories < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :memories do |t|
      t.string :first_name, :null => false
      t.string :middle_name
      t.string :last_name, :null => false
      t.string :epitaph
      t.date :date_of_birth
      t.date :date_of_death
      t.text :description, :null => false
      t.belongs_to :user
      
      t.timestamps
    end
    
    add_foreign_key :memories, :user_id, :users
  end

  def self.down
    remove_foreign_key :memories, :user_id
    
    drop_table :memories
  end
end
