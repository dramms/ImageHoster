require 'spec_helper.rb'

describe Conversation do
	it "content not present " do
		m = Conversation.new( )
		m.should_not be_valid
	end

	it "content to short" do
		m = Conversation.new(:topic => "A")
		m.should_not be_valid
	end

	it "message valid" do
		m = Conversation.new(:topic => "Test Topic")
		m.should be_valid
	end
end