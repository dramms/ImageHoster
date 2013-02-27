class Conversation < ActiveRecord::Base
   attr_accessible :topic

   validates :topic,
   					:presence => true,
   					:length => {:minimum => 2};

   has_many :ConvUsers
   has_many :messages
   has_many :users, :through => :conv_users

	def self.get_conversations uid
		user = ConvUser.where(:user_id => uid).order(:created_at)
		conversations = Array.new
		user.each do |u|
			conversations << u.conversation
		end
		return conversations
	end

	def self.create_conversation topic, uid, fid, content
		conversation = Conversation.new
		conversation.topic = topic
		conversation.save
		ConvUser.create(:user_id => uid, :conversation_id => conversation.id)
		ConvUser.create(:user_id => fid, :conversation_id => conversation.id)
		Message.send_message(conversation.id, uid, content)
	end
end
