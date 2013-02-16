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
end
