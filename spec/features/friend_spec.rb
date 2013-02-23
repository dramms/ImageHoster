require 'spec_helper.rb'

describe Friend do

	before :each do
		User.new(:email => "dr@mymail.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456").save
		User.new(:email => "sn@mymail.com", :first_name => "Sascha", :last_name => "Nonte", :password => "123456").save
		User.new({"email"=>"mc@mymail.com", "first_name"=>"Marvin", "last_name"=>"Caspar", "password"=>"123456"}).save
		User.new({"email"=>"tp@mymail.com", "first_name"=>"Tobias", "last_name"=>"Prein", "password"=>"123456"}).save

		Friend.new(:user_id => 1, :friend_id => 2).save
		Friend.new(:user_id => 2, :friend_id => 1).save
		Friend.new(:user_id => 1, :friend_id => 3).save
		Friend.new(:user_id => 3, :friend_id => 1).save
	end


	before :each do
		visit "/"
		fill_in "user_email", :with => "dr@mymail.com"
		fill_in "user_password", :with => "123456"
		click_button "sign_in_button"
	end

	it "show friends" do
		click_link "myFriends"
		page.should have_content "Deine Freunde"
		page.should have_content "Sascha Nonte"
	end

	it "find friends" do

	end

	it "create request" do

	end

	it "show requests to me" do

	end

	it "accept request" do

	end

	it "cancel request" do

	end

	it "cancel friendship" do

	end
end