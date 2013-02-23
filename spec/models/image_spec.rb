require 'spec_helper.rb'

describe ImageComment do
	it "is invalid without title" do
		i = Image.create(:content => "TestContent")
		i.should_not be_valid
	end

	it "is invalid without content" do
		i = Image.create(:title => "TestTitle")
		i.should_not be_valid
	end

	it "is valid" do
		i = Image.create(:content => "TestContent", :title => "testTitle")
		i.should be_valid
	end
end