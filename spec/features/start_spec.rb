require 'spec_helper.rb'

describe Message do

	before :all do
		User.new(:email => "dr@mymail.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456").save
	end

	it "testing start page" do
		visit "/"
		page.should have_content "Sign in"
	end

	it "testing sign in" do
		visit "/"
		fill_in "user_email", :with => "dr@mymail.com"
		fill_in "user_password", :with => "123456"
		click_button "sign_in_button"

		page.should have_content "Willkommen"
	end

	it "testing sign out" do 
		visit "/"
		fill_in "user_email", :with => "dr@mymail.com"
		fill_in "user_password", :with => "123456"
		click_button "sign_in_button"

		click_link "sign_out"

		page.should have_content "Sign in"
	end

	it "create new user" do

	end

	it "edit user profile" do

	end
end
