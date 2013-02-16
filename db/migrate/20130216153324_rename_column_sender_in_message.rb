class RenameColumnSenderInMessage < ActiveRecord::Migration
  def up
  	rename_column(:messages, :sender, :user_id)
  end

  def down
  end
end
