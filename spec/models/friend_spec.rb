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

	it "find_not_in_conversations" do
		User.new(:email => "dr@mymail.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456").save
		User.new(:email => "sn@mymail.com", :first_name => "Sascha", :last_name => "Nonte", :password => "123456").save
		u1 = User.new({"email"=>"mc@mymail.com", "first_name"=>"Marvin", "last_name"=>"Caspar", "password"=>"123456"})
		u1.save

		Friend.new(:user_id => 1, :friend_id => 2).save
		Friend.new(:user_id => 2, :friend_id => 1).save
		Friend.new(:user_id => 1, :friend_id => 3).save
		Friend.new(:user_id => 3, :friend_id => 1).save

		Conversation.create(:topic => "Test")
		ConvUser.create(:conversation_id => 1, :user_id => 1)
		ConvUser.create(:conversation_id => 1, :user_id => 2)

		u2 = Friend.find_not_in_conversation 1, 1
		u2[0].should == u1
	end
end