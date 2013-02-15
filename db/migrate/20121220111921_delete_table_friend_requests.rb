class DeleteTableFriendRequests < ActiveRecord::Migration
  def up
  	drop_table :friend_requests
  end

  def down
  end
end
