class UsersController < ApplicationController

	def index
		@users = User.all
		@user = current_user
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(params.require(:user).permit(:email, :password, :password_confirmation))
		redirect_to users_url
	end

	def show
		@user = User.find(params[:id])
		unless current_user == @user || current_user.admin
			redirect_to users_path, notice: "You can only edit your own profile."
			#privacy issues
		end
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to users_url
	end

end