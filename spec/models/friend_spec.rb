require 'spec_helper.rb'

describe Friend do


	it "is not valid" do
		f = Friend.new(:user_id => 1)
		f.should_not be_valid
	end

	it "is valid" do
		f = Friend.new(:user_id => 1, :friend_id => 17)
		f.should be_valid
	end

	it "should no double entries exist" do
		f1 = Friend.new(:user_id => 1, :friend_id => 17).save
		f2 = Friend.new(:user_id => 1, :friend_id => 17)
		f2.should_not be_valid
	end
end