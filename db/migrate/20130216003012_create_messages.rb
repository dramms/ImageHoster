class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
		t.integer :conversation
  		t.integer :sender
  		t.string :content
      t.timestamps
    end
  end
end
