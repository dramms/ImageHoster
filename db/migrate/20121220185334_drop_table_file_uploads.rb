class DropTableFileUploads < ActiveRecord::Migration
  def up
  	drop_table :file_uploads
  end

  def down
  end
end
