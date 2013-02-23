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
end