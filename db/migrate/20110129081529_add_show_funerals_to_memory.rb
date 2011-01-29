class AddShowFuneralsToMemory < ActiveRecord::Migration
  def self.up
    change_table :memories do |t|
      t.boolean :show_funeral, :default => true
    end
  end

  def self.down
    remove_column :memories, :show_funeral
  end
end
