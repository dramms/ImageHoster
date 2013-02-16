class CreateImageComments < ActiveRecord::Migration
  def change
    create_table :image_comments do |t|
    	t.integer :image_id
    	t.integer :user_id
    	t.string :comment

      t.timestamps
    end
  end
end
