require 'spec_helper.rb'

describe ImageComment do
	before :each do
		User.new(:email => "dominic@ramms.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456").save
		Project.new(:user_id => 1, :title => "Test Titel").save
		Image.new(:content => "TestContent", :title => "testTitle", :project_id => 1).save
	end

	it "is invalid without image_id" do
		i = ImageComment.new(:user_id => 1, :comment => "Lala")
		i.should_not be_valid
	end

	it "is invalid without user_id" do
		i = ImageComment.new(:image_id => 1, :comment => "Lala")
		i.should_not be_valid
	end

	it "is invalid without content" do
		i = ImageComment.new(:user_id => 1, :image_id => "1")
		i.should_not be_valid
	end

	it "is invalid when content is to short" do
		i = ImageComment.new(:user_id => 1, :image_id => 1, :comment => "L")
		i.should_not be_valid
	end

	it "is valid" do
		i = ImageComment.new(:user_id => 1, :image_id => 1, :comment => "Lala")
		i.should be_valid
	end
end