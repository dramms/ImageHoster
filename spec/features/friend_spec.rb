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

		visit "/"
		fill_in "user_email", :with => "dr@mymail.com"
		fill_in "user_password", :with => "123456"
		click_button "sign_in_button"
	end

	it "show friends" do
		page.should have_content "Willkommen"
		click_link "myFriends"
		page.should have_content "Deine Freunde"
		page.should have_content "Sascha Nonte"
	end

	it "find friends click" do
		click_link "findFriends"
		page.should have_content "Freunde suchen"
	end

	it "find friends search full name" do
		click_link "findFriends"
		fill_in "search_field", :with => "Tobias"
		fill_in "search_field_last_name", :with => "Prein"
		click_button "search"
		page.should have_content "Tobias Prein"
	end

	it "should not find friend in search if only first name known" do
		click_link "findFriends"
		fill_in "search_field", :with => "Tobias"
		click_button "search"
		page.should_not have_content "Tobias Prein"
	end

	it "should not find friend in search if only last name known" do
		click_link "findFriends"
		fill_in "search_field_last_name", :with => "Tobias"
		click_button "search"
		page.should_not have_content "Tobias Prein"
	end

	it "find friends search" do
		click_link "findFriends"
		fill_in "search_field", :with => "Tobias"
		fill_in "search_field_last_name", :with => "Prein"
		click_button "search"
		page.should have_content "Tobias Prein"
	end

	it "create request" do
		click_link "findFriends"
		fill_in "search_field", :with => "Tobias"
		fill_in "search_field_last_name", :with => "Prein"
		click_button "search"
		click_button "sendRequest"
		page.should have_content "Freunde suchen"
		page.should_not have_content "Tobias Prein"
	end

	it "can't create friendship if already exists" do

	end

	it "show requests to me" do
		FriendRequests.new(:user_id => 4, :friend_id => 1).save
		click_link "showRequests"
		page.should have_content "Tobias Prein"
	end

	it "accept request" do
		FriendRequests.new(:user_id => 4, :friend_id => 1).save
		click_link "showRequests"
		click_button "accept"
		page.should_not have_content "Tobias Prein"
		click_link "myFriends"
		page.should have_content "Tobias Prein"
	end

	it "cancel request" do

	end

	it "cancel friendship over myFriends" do
		click_link "myFriends"
		page.should have_content "Marvin Caspar"
		click_button "deleteFriendship3"
		page.should_not have_content "Marvin Caspar"
	end
end