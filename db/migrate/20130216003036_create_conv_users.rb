class CreateConvUsers < ActiveRecord::Migration
  def change
    create_table :conv_users do |t|
		t.integer :user_id
  		t.integer :conversation_id
      t.timestamps
    end
  end
end
