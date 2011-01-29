class AddPermalinkToMemory < ActiveRecord::Migration
  def self.up
    change_table :memories do |t|
      t.string :permalink, :null => false
    end
  end

  def self.down
    remove_column :memories, :permalink
  end
end
