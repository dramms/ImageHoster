class Friend < ActiveRecord::Base
		attr_accessible :user_id, :friend_id
		belongs_to :user

	validates :user_id,  
						:uniqueness => {:scope => :friend_id}


	def self.create_friendship uid, fid
		Friend.create(:user_id => uid, :friend_id => fid)
		Friend.create(:user_id => fid, :friend_id => uid)
		FriendRequests.where(:user_id => fid, :friend_id => uid).first.delete
#		FriendRequests.find(1).delete
	end

	def self.delete_friendship uid, fid
		Friend.where(:user_id => uid, :friend_id => fid).first.delete
		Friend.where(:user_id => fid, :friend_id => uid).first.delete
	end
end
