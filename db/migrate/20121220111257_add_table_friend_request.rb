class AddTableFriendRequest < ActiveRecord::Migration
  def up
  	create_table :friend_requests do |t|
			t.integer :user_id
			t.integer :friend_id
      t.timestamps
  end
  end

  def down
  end
end
