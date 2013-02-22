class CreateTableImageComment < ActiveRecord::Migration
  def change
    create_table :image_comment do |t|
      t.integer :user_id
      t.integer :image_id
      t.string :comment

      t.timestamps
    end
  end
end
