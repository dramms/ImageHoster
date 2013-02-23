require 'spec_helper.rb'

describe FriendRequests do
	it "is invalid without friend_id" do
		f = FriendRequests.new(:user_id => 1)
		f.should_not be_valid
	end

	it "is invalid without user_id" do
		f = FriendRequests.new(:friend_id => 1)
		f.should_not be_valid
	end

	it "should be invalid if entry already exists" do
		f1 = FriendRequests.new(:user_id => 1, :friend_id => 17).save
		f2 = FriendRequests.new(:user_id => 1, :friend_id => 17)
		f2.should_not be_valid
	end

	it "is valid" do
		f = FriendRequests.new(:user_id => 1, :friend_id => 17)
		f.should be_valid
	end
end