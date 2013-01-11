class AddImageToImages < ActiveRecord::Migration
  def self.up
  	add_column :images, :images_file_name, :string
  	add_column :images, :images_content_type, :string
  	add_column :images, :images_file_size, :integer
  end
  def self.down
  	remove_column :images, :images_file_name, :string
  	remove_column :images, :images_content_type, :string
  	remove_column :images, :images_file_size, :integer
  end
end
