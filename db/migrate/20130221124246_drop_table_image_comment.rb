class DropTableImageComment < ActiveRecord::Migration
  def up
  	drop_table :image_comment
  end

  def down
  end
end
