class ConvUser < ActiveRecord::Base
	attr_accessible :user_id, :conversation_id

	validates :conversation_id,
						:presence => true;

	validates :user_id,
						:presence => true;

	belongs_to :conversation
	belongs_to :user

	#validates_association

	def self.add_user fid, conv_id
		ConvUser.create(:user_id => fid, :conversation_id => conv_id)
	end

	def self.delete_user uid, conv_id
		c = ConvUser.where(:conversation_id => conv_id).count
		if (c == 1)
			ConvUser.where(:user_id => uid, :conversation_id => conv_id).first.delete
			message = Message.where(:conversation_id => conv_id)
			message.each do |m|
				m.delete
			end
			Conversation.where(:id => conv_id).first.delete
		else
			ConvUser.where(:user_id => uid, :conversation_id => conv_id).first.delete
		end
	end
end
