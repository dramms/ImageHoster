require 'spec_helper.rb'

describe FriendRequests do
	it "is not valid" do
		f = FriendRequests.new(:user_id => 1)
		f.should_not be_valid
	end

	it "is valid" do
		f = FriendRequests.new(:user_id => 1, :friend_id => 17)
		f.should be_valid
	end

	it "should no double entries exist" do
		f1 = FriendRequests.new(:user_id => 1, :friend_id => 17).save
		f2 = FriendRequests.new(:user_id => 1, :friend_id => 17)
		f2.should_not be_valid
	end
end