require 'spec_helper'

describe MessageInfo do
 	it "is invalid without user_id" do
		mi = MessageInfo.new( )
		mi.should_not be_valid
	end

	it "is valid" do
		mi = MessageInfo.new(:user_id => 1)
		mi.should be_valid
	end

	it "has no new message" do
		MessageInfo.new(:user_id => 1).save
		MessageInfo.new_message(2).should == false
	end

	it "has a new message" do
		MessageInfo.new(:user_id => 1).save
		MessageInfo.new_message(1).should == true
	end

	it "has no new messages after delete" do
		MessageInfo.new(:user_id => 1).save
		MessageInfo.delete_info(1)
		MessageInfo.new_message(2).should == false
	end
end
