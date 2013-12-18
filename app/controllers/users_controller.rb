class UsersController < ApplicationController

	def index
		@users = User.all
		@user = current_user
		unless current_user.admin == "true"
		redirect_to root_path, notice: "Uh oh, you don't have permission to view that!"
		end #still need to create an admin
	end

	def new
		@user = User.new
	end

	def create
	end

	def show
		@user = User.find(params[:id])
		unless current_user == @user || current_user.admin
			redirect_to users_path, notice: "You can only edit your own profile."
			#privacy issues
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to users_url
	end

end