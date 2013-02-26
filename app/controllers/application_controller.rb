class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :authenticate_user!, :except => [:index]
	before_filter :set_locale
	before_filter :get_message_info

	helper :all

	def get_message_info
		if user_signed_in?
			@message_info = MessageInfo.new_message current_user.id
		else
			#@message_info = "laal2"
		end
		
	end

	private
	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
		Rails.application.routes.default_url_options[:locale]= I18n.locale
	end

	def after_sign_in_path_for(resource)
		user_index_path
	end
end
