class UserController < ApplicationController

	#encoding: utf-8

	def show

    respond_to do |format|
      format.html { render user_test_path }
      format.json { render json: @post }
    end
  end

	def edit_email
		respond_to do |format|
      if current_user.update_attributes(params[:user])
				format.html { redirect_to user_settings_path, notice: 'E-Mail wurde erfolgreich geandert.' }
        format.json { head :no_content }
			else
				format.html { redirect_to user_settings_path, notice: 'Fehler beim andern der E-Mail.' }
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
end
