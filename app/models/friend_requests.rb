class FriendRequests < ActiveRecord::Base
	attr_accessible :user_id, :friend_id
	belongs_to :user

	validates :user_id, :presence => true;
	validates :friend_id, :presence => true;


	validates :user_id,  
						:uniqueness => {:scope => :friend_id}

	validate :not_same_person

	#validates_association?
	def not_same_person
		if (user_id == friend_id)
			errors.add(:same_person, "...")
		end
	end

	def self.create_request uid, fid
		FriendRequests.create(:user_id => uid, :friend_id => fid)
	end

	def self.delete_request uid, fid
		FriendRequests.where(:user_id => uid, :friend_id => fid).first.delete
	end
end
