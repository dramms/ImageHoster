class UserController < ApplicationController

	def show
    #@post = Post.find(params[:id])

    respond_to do |format|
      format.html { render user_test_path }
      format.json { render json: @post }
    end
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
				format.html { redirect_to user_settings_path, notice: 'Name wurde erfolgsreich geändert.' }
        format.json { head :no_content }
			else
				format.html { redirect_to user_settings_path, notice: 'Fehler beim ändern des Names.' }
			end
		end
	end		
end
