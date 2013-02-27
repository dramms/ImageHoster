require 'spec_helper.rb'

describe ConvUser do
	it "is invalid without conversation_id" do
		u = ConvUser.new(:user_id => 1)
		u.should_not be_valid
	end

	it "is invalid without user_id" do
		u = ConvUser.new(:conversation_id => 1)
		u.should_not be_valid
	end

	it "is valid" do
		u = ConvUser.new(:conversation_id => 1, :user_id => 1)
		u.should be_valid
	end

	it "can add a user" do
		User.create(:email => "dominic@ramms.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456")
		Conversation.create(:topic => "Test Topic")
		ConvUser.add_user(1, 1)
		c = ConvUser.find(1)
		c.should be_valid
	end
end