class CreateMessageInfos < ActiveRecord::Migration
  def change
    create_table :message_infos do |t|
    	t.integer :user_id
      t.timestamps
    end
  end
end
