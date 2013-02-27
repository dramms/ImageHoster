require 'spec_helper.rb'

describe Message do

	
	before :each do
		User.new(:email => "dr@mymail.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456").save
		User.new(:email => "sn@mymail.com", :first_name => "Sascha", :last_name => "Nonte", :password => "123456").save
		User.new({"email"=>"mc@mymail.com", "first_name"=>"Marvin", "last_name"=>"Caspar", "password"=>"123456"}).save
		User.new({"email"=>"tp@mymail.com", "first_name"=>"Tobias", "last_name"=>"Prein", "password"=>"123456"}).save

		Friend.new(:user_id => 1, :friend_id => 2).save
		Friend.new(:user_id => 2, :friend_id => 1).save
		Friend.new(:user_id => 1, :friend_id => 3).save
		Friend.new(:user_id => 3, :friend_id => 1).save

		FriendRequests.create(:user_id => 1, :friend_id => 15)
		FriendRequests.create(:user_id => 2, :friend_id => 15)
		FriendRequests.create(:user_id => 3, :friend_id => 15)

		Conversation.create(:topic => "Spass")
		ConvUser.create(:user_id => 1, :conversation_id => 1)
		ConvUser.create(:user_id => 2, :conversation_id => 1)
		ConvUser.create(:user_id => 3, :conversation_id => 1)
		Message.create(:conversation_id => 1, :user_id => 1, :content => "Hallo zusammen")
		Message.create(:conversation_id => 1, :user_id => 2, :content => "Hallo, wie gehts?")
		Message.create(:conversation_id => 1, :user_id => 3, :content => "Hallo, gut und euch?")

		visit "/users/sign_in"
		fill_in "user_email", :with => "dr@mymail.com"
		fill_in "user_password", :with => "123456"
		click_button "sign_in_button"
		click_link "message"
	end

	it "shows all conversations" do
		page.should have_content "Nachricht"
		page.should have_content "Spass"
	end

	it "new conversation" do
		click_link "newMessage"
		page.should have_content "Sascha Nonte"
		page.should have_content "Thema eingeben"
		page.should have_content "Inhalt"
	end

	it "new answer" do
		click_link "showConversation1"
		page.should have_content "Dominic Ramms"
		page.should have_content "Sascha Nonte"
		page.should have_content "Marvin Caspar"
		page.should_not have_content "Tobias Prein"
	end

	it "add user" do
		User.new(:email => "tk@mymail.com", :first_name => "Till", :last_name => "Krueger", :password => "123456").save
		Friend.new(:user_id => 1, :friend_id => 5).save
		Friend.new(:user_id => 5, :friend_id => 1).save
		click_link "showConversation1"
		page.should have_content "Till Krueger"
		click_button "addUser"
		page.should have_content "Till Krueger"
	end

	it "send message from friend profile" do
		visit "/de/user/show?user=2"
		fill_in "topic", :with => "Test Topic"
		fill_in "content", :with => "Inhalt"
		click_button "sendMessage"
		page.should have_content "Test Topic"
	end

	it "delete user from message" do
		click_link "showConversation1"
		click_button "deleteFromConv"
		page.should_not have_content "Spass"
	end

	it "deletes conversation" do
		Conversation.create(:topic => "Test")
		ConvUser.create(:user_id => 1, :conversation_id => 2)
		click_link "message"
		click_link "showConversation2"
		click_button "deleteFromConv"
		page.should_not have_content "Test"
	end
end