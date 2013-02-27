require 'spec_helper.rb'

describe Project do

	before :each do
		User.new(:email => "dr@mymail.com", :first_name => "Dominic", :last_name => "Ramms", :password => "123456").save
		User.new(:email => "sn@mymail.com", :first_name => "Sascha", :last_name => "Nonte", :password => "123456").save
		User.new({"email"=>"mc@mymail.com", "first_name"=>"Marvin", "last_name"=>"Caspar", "password"=>"123456"}).save
		User.new({"email"=>"tp@mymail.com", "first_name"=>"Tobias", "last_name"=>"Prein", "password"=>"123456"}).save

		Friend.new(:user_id => 1, :friend_id => 2).save
		Friend.new(:user_id => 2, :friend_id => 1).save
		Friend.new(:user_id => 1, :friend_id => 3).save
		Friend.new(:user_id => 3, :friend_id => 1).save

		visit "/users/sign_in"
		fill_in "user_email", :with => "dr@mymail.com"
		fill_in "user_password", :with => "123456"
		click_button "sign_in_button"
	end

	it "is valid new project" do
		click_link "project"
		page.should have_content "Meine Projekte"
		click_link "newProject"
		fill_in "project_title", :with => "Test Titel"
		fill_in "project_content", :with => "Test Content"
		click_button "createProject"
		page.should have_content "Test Titel"
	end

	it "can show a project" do
		Project.create(:title => "Test Project", :user_id => 1, :content => "Test Content")
		click_link "project"
		page.should have_content "Test Project"
		visit "projects/1"
		page.should have_content "Test Project"
	end

	it "can edit a project" do
		Project.create(:title => "Test Project", :user_id => 1, :content => "Test Content")
		click_link "project"
		page.should have_content "Test Project"
		visit "projects/1/edit"
		page.should have_content "Editing project"
		fill_in "project_title", :with => "Test Titel"
		fill_in "project_content", :with => "Test Content"
		click_button "createProject"
		page.should have_content "Test Titel"
	end

	it "can delete a project" do
		Project.create(:title => "Test Project", :user_id => 1, :content => "Test Content")
		click_link "project"
		page.should have_content "Test Project"
		click_link "delete1"
		page.should have_content "Meine Projekte"
		page.should_not have_content "Test Project"
	end

end