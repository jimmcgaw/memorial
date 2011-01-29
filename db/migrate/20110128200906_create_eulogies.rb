require 'migration_helpers'

class CreateEulogies < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :eulogies do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, :null => false
      t.belongs_to :memory, :null => false

      t.timestamps
    end
    
    add_foreign_key :eulogies, :user_id, :users 
    add_foreign_key :eulogies, :memory_id, :memories
  end

  def self.down
    remove_foreign_key :eulogies, :user_id
    remove_foreign_key :eulogies, :memory_id
    
    drop_table :eulogies
  end
end
