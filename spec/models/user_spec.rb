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

	end

	it "find requests" do

	end
end