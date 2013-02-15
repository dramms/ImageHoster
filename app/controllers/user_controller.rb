# encoding: utf-8

class UserController < ApplicationController

	def index
		@users = User.all()
#    @user = current_user

#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @posts }
#    end
  end

	def edit_email
		respond_to do |format|
      if current_user.update_attributes(params[:user])
				format.html { redirect_to user_settings_path, notice: 'E-Mail wurde erfolgreich geändert.' }
#				format.html { redirect_to :back }
        format.json { head :no_content }
			else
#				format.html { redirect_to :back }
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

	def search
  	@users = User.search params[:search]
	end

	
end