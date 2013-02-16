require 'spec_helper.rb'

describe User do
	it "create without email" do
		u = User.new(:first_name => "Dominic", :last_name => "Ramms", :password => "123456")
		u.should_not be_valid
	end

	it "create without first name" do
		u = User.new(:email => "dominic@ramms.com", :last_name => "Ramms", :password => "123456")
		u.should_not be_valid
	end

	it "create without last name" do
		u = User.new(:email => "dominic@ramms.com", :first_name => "Dominic", :password => "123456")
		u.should_not be_valid
	end

	it "error in email 1" do
		u = User.new(:email => "dominic@rammscom", :first_name => "Dominic", :last_name => "Ramms", :password => "123456")
		u.should_not be_valid
	end

	it "error in email 2" do
		u = User.new(:email => "dominicramms.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456")
		u.should_not be_valid
	end

end