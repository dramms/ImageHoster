class DropTablePictureComments2 < ActiveRecord::Migration
  def up
  	drop_table :picture_comments
  end

  def down
  end
end
