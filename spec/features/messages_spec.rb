require 'spec_helper.rb'

describe Message do

	User.create(:email => "dr@mymail.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456")

	before :each do
		visit "/"
		fill_in "user_email", :with => "dr@mymail.com"
		fill_in "user_password", :with => "123456"
		click_button "sign_in_button"
		click_link "message"
	end

	it "shows all conversations" do
		page.should have_content "Nachricht"
	end

	it "new conversation" do

	end

	it "new answer" do

	end

	it "add user" do

	end

	it "see if new message info appers" do

	end

	it "see if new message info disapears" do

	end
end