class MessagesController < ApplicationController

	def index
		@conversations = Conversation.get_conversations current_user.id
		MessageInfo.delete_info current_user.id
		if params[:conv_id].present?
			is_participant = ConvUser.where(:user_id => current_user, :conversation_id => params[:conv_id])
			if (is_participant.present?)
				@message = Message.where(:conversation_id => params[:conv_id]).paginate(:page => params[:page],
				:per_page => 5,
				:order => 'created_at DESC')
				@conv_id = params[:conv_id]
				@is_answer = true
				@friends = Friend.find_not_in_conversation current_user.id, params[:conv_id]
				@participants = Friend.find_in_conversation params[:conv_id]
			end
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
			is_participant = ConvUser.where(:user_id => current_user, :conversation_id => params[:conv_id])
			if (is_participant.present?)
				Message.send_message params[:conv_id], current_user.id, params[:answer]
			end
		end
		redirect_to messages_path(:conv_id => params[:conv_id])
	end

	def create_conversation
		Conversation.create_conversation params[:topic], current_user.id, params[:friend], params[:answer]
		redirect_to messages_path
	end

	def add_user
		ConvUser.add_user params[:friend], params[:conv_id]
		redirect_to messages_path(:conv_id => params[:conv_id])
	end

	def show_conversation
		#message_info spalte für converstion_id hinzufügen, hierdrauf für Nachrichten verlinken
		#Info aus message_info löschen
	end

	def delete_user
		ConvUser.delete_user current_user.id, params[:conv_id]
		redirect_to messages_path
	end
end