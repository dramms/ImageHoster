require 'spec_helper.rb'

describe Image do

	before :each do
		User.new(:email => "dr@mymail.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456").save
		Project.create(:title => "Test Project", :user_id => 1, :content => "Test Content")

		visit "/users/sign_in"
		fill_in "user_email", :with => "dr@mymail.com"
		fill_in "user_password", :with => "123456"
		click_button "sign_in_button"
		click_link "project"
		click_link "show1"
	end

	it "can create an image" do
		fill_in "image_title", :with => "Test Bild"
		fill_in "image_content", :with => "Test Bild"
		click_button "newImage"
		page.should have_content "Test Project"
	end

	it "can edit an image" do
		Image.create(:title => "Test Bild", :content => "Test Image", :project_id => 1)
		click_link "project"
		click_link "show1"
		click_link "image1"
		click_link "editImage"
		fill_in "image_title", :with => "new Title"
		fill_in "image_content", :with => "new Content"
		click_button "editImage"
		page.should have_content "new Title"
	end

	it "can delete an image" do

	end

end