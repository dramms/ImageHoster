require 'spec_helper.rb'

describe Message do
	it "is invalid without conversation_id" do
		m = Message.new(:user_id => 1, :content => "Test123")
		m.should_not be_valid
	end

	it "is invalid without user_id" do
		m = Message.new(:conversation_id => 1, :content => "Test123")
		m.should_not be_valid
	end

	it "is invalid without content" do
		m = Message.new(:conversation_id => 1, :user_id => 1)
		m.should_not be_valid
	end

	it "is invalid with content < 2" do
		m = Message.new(:conversation_id => 1, :user_id => 1, :content => "T")
		m.should_not be_valid
	end

	it "is valid" do
		m = Message.new(:conversation_id => 1, :user_id => 1, :content => "Test123")
		m.should be_valid
	end

	it "get ordered messages" do

	end

	it "send at" do

	end
end