class Friend < ActiveRecord::Base
		attr_accessible :id_one, :id_two
		belongs_to :user
end
