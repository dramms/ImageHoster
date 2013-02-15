class AddColumnRequestToFriends < ActiveRecord::Migration
  def change
  	add_column :friends, :requeststatus, :boolean, :default => 0
  end
end
