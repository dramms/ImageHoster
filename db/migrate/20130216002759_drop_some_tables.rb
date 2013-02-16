class DropSomeTables < ActiveRecord::Migration
  def up
  	drop_table :conversations
  	drop_table :messages
  	drop_table :conv_user
  end

  def down
  end
end
