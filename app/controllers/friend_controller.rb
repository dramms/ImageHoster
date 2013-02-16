class FriendController < ApplicationController

	def search
		if params[:search]
			@users = User.search params[:search], params[:search_last_name]
			if @users.length > 0
				user = @users[0]
				@is_friend = Friend.is_friend current_user.id, user.id
			end
			render :action => 'search'
		end
	end

	def send_friendship_request
		if params
			FriendRequests.create_request current_user.id, params[:user][:id]
			if params[:last_site] == "profile"
				render :action => 'profile'
			else 
				render :action => 'search'
			end
		end
	end

	def showfriends
		@friends = Friend.find_friends current_user.id
	end

	def showrequest
		@requests = Friend.find_requests current_user.id
	end

	def accept_friendship_request
		if params
			Friend.create_friendship current_user.id, params[:user][:id]
			render :action => 'showrequest'
		end
	end

	def delete_friendship
		if params
			Friend.delete_friendship current_user.id, params[:user][:id]
			render :action => 'showfriends'
		end
	end

	def delete_friendship_request
		if params
			FriendRequests.delete_request current_user.id, params[:user][:id]
			render :action => 'showfriends'
		end
	end
end