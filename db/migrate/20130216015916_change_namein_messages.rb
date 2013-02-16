class ChangeNameinMessages < ActiveRecord::Migration
  def up
  	rename_column(:messages, :conversation, :conversation_id)
  end

  def down
  end
end
