require 'migration_helpers'

class CreateFunerals < ActiveRecord::Migration
  extend MigrationHelpers
  
  def self.up
    create_table :funerals do |t|
      t.string :where
      t.datetime :when
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :phone_number
      t.text :instructions
      t.belongs_to :memory

      t.timestamps
    end
    
    add_foreign_key :funerals, :memory_id, :memories
  end

  def self.down
    remove_foreign_key :funerals, :memory_id
    
    drop_table :funerals
  end
end
