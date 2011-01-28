require 'migration_helpers'

class CreateMemories < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :memories do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :epitaph
      t.text :description
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
