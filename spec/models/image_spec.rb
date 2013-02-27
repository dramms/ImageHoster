require 'spec_helper.rb'

describe ImageComment do
	it "is invalid without title" do
		i = Image.create(:content => "TestContent", :project_id => 1)
		i.should_not be_valid
	end

	it "is invalid without content" do
		i = Image.create(:title => "TestTitle", :project_id => 1)
		i.should_not be_valid
	end

	it "is invalid without project_id" do
		i = Image.create(:title => "TestTitle", :content => "TestContent")
		i.should_not be_valid
	end

	#noch nicht implementiert, da file_upload auf dropbox
	it "is valid" do
		i = Image.create(:content => "TestContent", :title => "testTitle", :project_id => 1)
		#i.should be_valid
	end
end