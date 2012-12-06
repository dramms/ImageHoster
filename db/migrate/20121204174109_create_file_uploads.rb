class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.string :file_path
      t.integer :user_id
      t.string :file_type
      t.string :description

      t.timestamps
    end
  end
end
