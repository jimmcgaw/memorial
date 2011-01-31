class AddImageFieldsToMemory < ActiveRecord::Migration
  def self.up
    add_column :memories, :image_file_name, :string
    add_column :memories, :image_content_type, :string
    add_column :memories, :image_file_size, :integer
    add_column :memories, :image_updated_at, :datetime
  end

  def self.down
    remove_column :memories, :image_file_name
    remove_column :memories, :image_content_type
    remove_column :memories, :image_file_size
    remove_column :memories, :image_updated_at
  end
end
