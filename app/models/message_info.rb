class MessageInfo < ActiveRecord::Base
   attr_accessible :user_id

   belongs_to :user

   validates :user_id,
						:presence => true;

	def self.new_message uid
		new_info = MessageInfo.where(:user_id => uid).count
		if new_info == 0
			return false
		else
			return true
		end
	end

	def self.delete_info uid
		info = MessageInfo.where(:user_id => uid)
		info.each do |i|
			i.delete
		end
	end
end
