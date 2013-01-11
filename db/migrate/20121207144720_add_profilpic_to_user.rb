class AddProfilpicToUser < ActiveRecord::Migration
  def change
			add_column :users, :profilpic, :string
  end
end
