require 'spec_helper.rb'

describe User do
	it "is invalid without email" do
		u = User.new(:first_name => "Dominic", :last_name => "Ramms", :password => "123456")
		u.should_not be_valid
	end

	it "is invalid without first_name" do
		u = User.new(:email => "dominic@ramms.com", :last_name => "Ramms", :password => "123456")
		u.should_not be_valid
	end

	it "is invalid without last_name" do
		u = User.new(:email => "dominic@ramms.com", :first_name => "Dominic", :password => "123456")
		u.should_not be_valid
	end

	it "is invalid without dot in email" do
		u = User.new(:email => "dominic@rammscom", :first_name => "Dominic", :last_name => "Ramms", :password => "123456")
		u.should_not be_valid
	end

	it "is invalid without @ in email" do
		u = User.new(:email => "dominicramms.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456")
		u.should_not be_valid
	end

	it "is a valid user" do
		u = User.new(:email => "dominic@ramms.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456")
		u.should be_valid
	end

	#methods
	it "returns a users full name as a string" do
		u = User.new(:email => "dominicramms.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456")
		u.name.should == "Dominic Ramms"
	end

	it "didn't return a search user by its first and last name" do
		u = User.new(:email => "dominic@ramms.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456")
		u.save
		u1 = User.search("Sascha", "Nonte", 1)
		u1[0].should_not == u
	end

	it "returns a search user by its first and last name" do
		User.new(:email => "dominic@ramms.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456").save
		#User.new(:email => "sascha@nonte.com", :first_name => "Sascha", :last_name => "Nonte", :password => "123456").save
		u = User.find(1)
		u1 = User.search("Dominic", "Ramms", 2)
		u1[0].should == u
	end

	it "find friends" do
		User.new(:email => "dr@mymail.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456").save
		u1 = User.new(:email => "sn@mymail.com", :first_name => "Sascha", :last_name => "Nonte", :password => "123456")
		u1.save
		#User.new(:email => "mc@mymail.com", :first_name => "Marvin", :last_name => "Caspar", :password => "123456").save
		Friend.new(:user_id => 1, :friend_id => 2).save
		Friend.new(:user_id => 2, :friend_id => 1).save
		u2 = User.find_friends 1
		u2[0].should == u1
	end

	it "find requests" do
		User.new(:email => "dr@mymail.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456").save
		u1 = User.new(:email => "sn@mymail.com", :first_name => "Sascha", :last_name => "Nonte", :password => "123456")
		u1.save
		FriendRequests.new(:user_id => 2, :friend_id => 1).save
		u2 = User.find_requests 1
		u2[0].should == u1
	end

	it "find own requests" do
		User.new(:email => "dr@mymail.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456").save
		u1 = User.new(:email => "sn@mymail.com", :first_name => "Sascha", :last_name => "Nonte", :password => "123456")
		u1.save
		FriendRequests.new(:user_id => 1, :friend_id => 2).save
		u2 = User.find_own_requests 1
		u2[0].should == u1
	end
end