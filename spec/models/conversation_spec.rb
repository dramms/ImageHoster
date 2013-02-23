require 'spec_helper.rb'

describe Conversation do
	it "is invalid without content" do
		m = Conversation.new( )
		m.should_not be_valid
	end

	it "is invalid when content is to short" do
		m = Conversation.new(:topic => "A")
		m.should_not be_valid
	end

	it "is valid" do
		m = Conversation.new(:topic => "Test Topic")
		m.should be_valid
	end

	it "shouldn't forget to return conversations" do
		m = Conversation.new(:topic => "Test Topic")
		m.save
		ConvUser.new(:conversation_id => m.id, :user_id => 1).save
		n = Conversation.new(:topic => "Test2")
		n.save
		ConvUser.new(:conversation_id => n.id, :user_id => 1).save
		o = Conversation.new(:topic => "Test2")
		o.save
		ConvUser.new(:conversation_id => o.id, :user_id => 1).save
		Conversation.get_conversations(1).should_not == [m, n]
	end

	it "shouldn't return conversations from an other user" do
		m = Conversation.new(:topic => "Test Topic")
		m.save
		ConvUser.new(:conversation_id => m.id, :user_id => 1).save
		n = Conversation.new(:topic => "Test2")
		n.save
		ConvUser.new(:conversation_id => n.id, :user_id => 1).save
		o = Conversation.new(:topic => "Test2")
		o.save
		ConvUser.new(:conversation_id => o.id, :user_id => 2).save
		Conversation.get_conversations(1).should_not == [m, n, o]
	end

	it "returns the right conversations" do
		m = Conversation.new(:topic => "Test Topic")
		m.save
		ConvUser.new(:conversation_id => m.id, :user_id => 1).save
		n = Conversation.new(:topic => "Test2")
		n.save
		ConvUser.new(:conversation_id => n.id, :user_id => 1).save
		o = Conversation.new(:topic => "Test2")
		o.save
		ConvUser.new(:conversation_id => o.id, :user_id => 2).save
		Conversation.get_conversations(1).should == [m, n]
	end

	it "create conversations" do
		Conversation.create_conversation("Topic", 1, 2)
		c = Conversation.find(1)
		Conversation.exists?(c).should == true
	end
end