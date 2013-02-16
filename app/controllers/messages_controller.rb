class MessagesController < ApplicationController

	def index
		@conversations = Conversation.get_conversations current_user.id
		MessageInfo.delete_info current_user.id
		if params[:conv_id].present?
			@message = Message.get_ordered_messages params[:conv_id]
			
			@conv_id = params[:conv_id]
			@is_answer = true
			@friends = Friend.find_not_in_conversation current_user.id, params[:conv_id]
		end
		if params[:new_message]
			@friends = Friend.find_friends current_user.id
			@is_new_conversation = true
		end
	end

	def create_answer
		if params[:answer] == nil
			#
		else
			Message.send_message params[:conv_id], current_user.id, params[:answer]
		end
		redirect_to messages_path(:conv_id => params[:conv_id])
	end

	def create_conversation
		Conversation.create_conversation params[:topic], current_user.id, params[:friend]
		redirect_to messages_path
	end

	def add_user
		ConvUser.add_user params[:friend], params[:conv_id]
		redirect_to messages_path(:conv_id => params[:conv_id])
	end
end