class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :authenticate_user!, :except => [:index]
	before_filter :set_locale

	private
	def set_locale
		I18n.locale = params[:locale] || I18n.default_locale
		Rails.application.routes.default_url_options[:locale]= I18n.locale
	end

	def after_sign_in_path_for(resource)
		user_home_path
	end
end
