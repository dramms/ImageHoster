require 'spec_helper.rb'

describe Project do
	it "is invalid without user_id" do
		p = Project.new(:title => "TestTitel")
		p.should_not be_valid
	end

	it "is invalid without title" do
		p = Project.new(:user_id => 1)
		p.should_not be_valid
	end

	it "is invalid when title is to short" do
		m = Project.new(:title => "T")
		m.should_not be_valid
	end

	it "is valid" do
		m = Project.new(:user_id => 1, :title => "TestTitel")
		m.should be_valid
	end
end