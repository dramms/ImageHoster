class RenamePictureIdInPicturecomments < ActiveRecord::Migration
   def change
    rename_column :picture_comments, :picture_id, :image_id
  end
end
