# encoding: utf-8

class UserController < ApplicationController

	def index
		@users = User.all()
		@friend_requests = User.find_requests current_user.id
		conversation = current_user.conversations
		@messages = Array.new

		conversation.each do |c|
			messages = c.messages
			messages.each do |m|
				@messages << m
			end
		end
		@messages.sort!
		@messages = @messages.take(10)
  	end

  	def show
		@user = current_user.id
		if params[:user] == nil || params[:user] == current_user.id.to_s
			#@user is ID of current user
			@user_id = current_user.id
			#gets own friends to display on profile
			@friends = Friend.find_friends current_user.id
			#old
			#@friends = User.joins(:friends).where(:friends => {:friend_id => current_user})
			@projects = Project.where(:user_id => current_user.id)

			@test = 1
	
		else
			#request if profile belongs to friend (1: is friend; 0: is not a friend)
			p = params[:user]
			@is_friend = Friend.is_friend current_user.id, params[:user]
			#Abfrage, ob schon eine Anfrage von einer der beiden Personen vorliegt, wenn nicht befreundet
			if @is_friend == 1
				@friends = Friend.find_friends params[:user]
			else
				#Abfrage ob current_user eine gestellt hat
				@current_user_request = FriendRequests.where(:user_id => current_user.id, :friend_id => params[:user]).count
				@other_user_request = FriendRequests.where(:user_id => params[:user], :friend_id => current_user.id).count
			
			end
			#@user is ID of other user
			@user_id = params[:user]
			@users = User.where("id = " + params[:user])
			@thisUser = User.find(params[:user])
			@test = 2
		end
  	end

  	def edit

  	end

  	def settings
  		@user = User.create(params[:id]);
  	end

  	def avatar_upload
  		render :action => "settings"
  	end

	def edit_email
		respond_to do |format|
      if current_user.update_attributes(params[:user])
				format.html { redirect_to user_settings_path, notice: 'E-Mail wurde erfolgreich geändert.' }
        format.json { head :no_content }
			else
				format.html { redirect_to user_settings_path, notice: 'Fehler beim ändern der E-Mail.' }
			end
		end
	end
	
	def edit_name
		respond_to do |format|
	      	if current_user.update_attributes(params[:user])
				format.html { redirect_to user_settings_path, notice: 'Name wurde erfolgsreich geandert.' }
	        	format.json { head :no_content }
			else
				format.html { redirect_to user_settings_path, notice: 'Fehler beim andern des Names.' }
			end
		end
	end	

	def search_user
		@user = User.where(:email => params[:user][:email])
		respond_to do |format|
			format.html
			redirect_to :back
		end
	end

	def profile
#		@user = current_user.id
		if params[:user] == nil || params[:user] == current_user.id.to_s
			#@user is ID of current user
			@user_id = current_user.id
			#gets own friends to display on profile
			@friends = Friend.find_friends current_user.id
			#old
			#@friends = User.joins(:friends).where(:friends => {:friend_id => current_user})
			@projects = Project.where(:user_id => current_user.id)

			@test = 1
	
		else
			#request if profile belongs to friend (1: is friend; 0: is not a friend)
			p = params[:user]
			@is_friend = Friend.is_friend current_user.id, params[:user]
			#Abfrage, ob schon eine Anfrage von einer der beiden Personen vorliegt, wenn nicht befreundet
			if @is_friend == 1
				@friends = Friend.find_friends params[:user]
			else
				#Abfrage ob current_user eine gestellt hat
				@current_user_request = FriendRequests.where(:user_id => current_user.id, :friend_id => params[:user]).count
				@other_user_request = FriendRequests.where(:user_id => params[:user], :friend_id => current_user.id).count
			
			end
			#@user is ID of other user
			@user_id = params[:user]
			@users = User.where("id = " + params[:user])
			@thisUser = User.find(params[:user])
			@test = 2
		end
	end

	def show_profile 
		render :action => 'profile'
	end
	
end
