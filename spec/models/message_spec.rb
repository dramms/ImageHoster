require 'spec_helper.rb'

describe Message do
	it "conversation not present " do
		m = Message.new(:user_id => 1, :content => "Test123")
		m.should_not be_valid
	end

	it "sender not present " do
		m = Message.new(:conversation_id => 1, :content => "Test123")
		m.should_not be_valid
	end

	it "content not present " do
		m = Message.new(:conversation_id => 1, :user_id => 1)
		m.should_not be_valid
	end

	it "content to short" do
		m = Message.new(:conversation_id => 1, :user_id => 1, :content => "T")
		m.should_not be_valid
	end

	it "message valid" do
		m = Message.new(:conversation_id => 1, :user_id => 1, :content => "Test123")
		m.should be_valid
	end
end