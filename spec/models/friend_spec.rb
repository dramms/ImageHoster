require 'spec_helper.rb'

describe Friend do
	it "is invalid without friend_id" do
		f = Friend.new(:user_id => 1)
		f.should_not be_valid
	end

	it "is invalid without user_id" do
		f = Friend.new(:friend_id => 1)
		f.should_not be_valid
	end

	it "should be invalid if entry already exists" do
		f1 = Friend.new(:user_id => 1, :friend_id => 17).save
		f2 = Friend.new(:user_id => 1, :friend_id => 17)
		f2.should_not be_valid
	end

	it "is valid" do
		f = Friend.new(:user_id => 1, :friend_id => 17)
		f.should be_valid
	end

	it "should not be a friend" do
		Friend.is_friend(1, 4).should == 0
	end

	it "should be a friend" do
		FriendRequests.create_request(2, 1)
		Friend.create_friendship(1, 2)
		Friend.is_friend(1, 2).should == 1
	end

	it "find_friends" do

	end

	it "find_requests" do

	end

	it "find_not_in_conversations" do

	end
end