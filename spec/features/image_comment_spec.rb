require 'spec_helper.rb'

describe ImageComment do

	before :each do		
		User.new(:email => "dr@mymail.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456").save
		Project.create(:title => "Test Project", :user_id => 1, :content => "Test Content")
		Image.create(:title => "Test Bild", :content => "Test Image", :project_id => 1)

		visit "/users/sign_in"
		fill_in "user_email", :with => "dr@mymail.com"
		fill_in "user_password", :with => "123456"
		click_button "sign_in_button"
		click_link "project"
		click_link "show1"
		click_link "image1"
	end

	it "can create a comment" do
		page.should have_content "Test Bild"
		fill_in "comment", :with => "Test Kommentar"
		click_button "sendComment"
		page.should have_content "Test Kommentar"
	end
end