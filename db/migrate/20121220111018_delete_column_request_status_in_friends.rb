class DeleteColumnRequestStatusInFriends < ActiveRecord::Migration
  def up
  	remove_column :friends, :requeststatus
  end

  def down
  end
end
