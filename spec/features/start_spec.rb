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
		visit "/users/sign_in"
		fill_in "user_email", :with => "dr@mymail.com"
		fill_in "user_password", :with => "123456"
		click_button "sign_in_button"

		page.should have_content "Willkommen"
	end

	it "testing sign out" do 
		visit "/users/sign_in"
		fill_in "user_email", :with => "dr@mymail.com"
		fill_in "user_password", :with => "123456"
		click_button "sign_in_button"

		click_link "sign_out"

		page.should have_content "Sign in"
	end

	it "create new user" do
		visit "/users/sign_up"
		fill_in "user_email", :with => "sn@mymail.com"
		fill_in "user_first_name", :with => "Sascha"
		fill_in "user_last_name", :with => "Nonte"
		fill_in "user_password", :with => "123456"
		fill_in "user_password_confirmation", :with => "123456"
		click_button "signUp"
		page.should have_content "Willkommen Sascha Nonte"
	end

	it "edit user profile" do
		visit "/users/sign_in"
		fill_in "user_email", :with => "dr@mymail.com"
		fill_in "user_password", :with => "123456"
		click_button "sign_in_button"
		visit "/de/user/settings/edit"
		fill_in "user_email", :with => "sn@mymail.com"
		fill_in "user_first_name", :with => "Sascha"
		fill_in "user_last_name", :with => "Nonte"
		fill_in "user_current_password", :with => "123456"
		click_button "update"
		page.should have_content "Mein Profil"
	end
end
