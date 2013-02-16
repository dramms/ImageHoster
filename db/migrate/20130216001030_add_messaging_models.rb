class AddMessagingModels < ActiveRecord::Migration
  def change
  	create_table :conversations do |t|
  		t.string :topic
  		t.timestamps
  	end

  	create_table :messages do |t|
  		t.integer :conversation
  		t.integer :sender
  		t.string :content
  		t.timestamps
  	end

  	create_table :conv_user do |t|
  		t.integer :user_id
  		t.integer :conversation_id
  		t.timestamps
  	end
  end
end
