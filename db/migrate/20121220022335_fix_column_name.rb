class FixColumnName < ActiveRecord::Migration
  def up
		rename_column :friends, :id_one, :user_id
		rename_column :friends, :id_two, :friend_id
  end

  def down
  end
end
