class Message < ActiveRecord::Base
	attr_accessible :conversation_id, :user_id, :content

	belongs_to :conversation
	belongs_to :user

	validates :conversation_id,
						:presence => true;

	validates :user_id,
						:presence => true;

	validates :content,
						:presence => true,
						:length => { :minimum => 2 };

	#validates_associated

	def self.send_message cid, uid, con
		Message.create(:conversation_id => cid, :user_id => uid, :content => con)
		conversation = ConvUser.where(:conversation_id => cid)
		conversation.each do |conv|
			if conv.user_id == uid
			else
				MessageInfo.create(:user_id => conv.user_id)
			end
		end
	end

	def self.get_ordered_messages conv_id
		Message.where(:conversation_id => conv_id).order(:created_at)
	end

	def send_at
		"#{created_at}"
	end
end
