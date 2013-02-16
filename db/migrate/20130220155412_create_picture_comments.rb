class CreatePictureComments < ActiveRecord::Migration
  def change
    create_table :picture_comments do |t|
      t.integer :user_id
      t.integer :picture_id
      t.string :kommentar

      t.timestamps
    end
  end
end
