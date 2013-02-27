class Friend < ActiveRecord::Base
		attr_accessible :user_id, :friend_id
		belongs_to :user

	validates :user_id, :presence => true;
	validates :friend_id, :presence => true;

	validates :user_id,  
						:uniqueness => {:scope => :friend_id}

	validate :not_name_person

	#validates_association?
	def not_name_person
		if (user_id == friend_id)
			errors.add(:same_person, "...")
		end
	end

	def self.create_friendship uid, fid
		Friend.create(:user_id => uid, :friend_id => fid)
		Friend.create(:user_id => fid, :friend_id => uid)
		FriendRequests.where(:user_id => fid, :friend_id => uid).first.delete
	end

	def self.delete_friendship uid, fid
		Friend.where(:user_id => uid, :friend_id => fid).first.delete
		Friend.where(:user_id => fid, :friend_id => uid).first.delete
	end

	def self.is_friend uid, fid
		Friend.where(:user_id => uid, :friend_id => fid).count
	end

	def self.is_friendd uid
		Friend.where(:user_id => uid)
	end

	def self.find_friends uid
		User.joins(:friends).where(:friends => {:friend_id => uid})
	end

	def self.find_requests uid
		User.joins(:friend_requestss).where(:friend_requests => {:friend_id => uid})
	end

	def self.find_not_in_conversation uid, conv_id
		friends = Friend.find_friends uid
		nfriends = Array.new
		friends.each do |friend|
			conv = ConvUser.where(:conversation_id => conv_id, :user_id => friend.id)
			if conv.present?
				
			else
				nfriends << friend
			end
		end
		return nfriends
	end
end
