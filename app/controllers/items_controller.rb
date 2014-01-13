class ItemsController < ApplicationController
	skip_before_action :require_login, only:[:show, :index]

	def index
		@items = Item.all
		@attendees = Attendee.all
	end

	def new
		@item = Item.new
		@party = Party.find(params[:format])
	end

	def create_item_access
		if current_user == :userid
			redirect_to :action => 'show', :id =>@item._id
		else
			flash[:notice] = "Uh oh, you're not signed in!"
		end
	end

	def create
		@item = Item.new(params[:item].permit(:party_id, :food_type, :food_name, :attendee_id))
		@item.party = Party.find(@item.party_id)
		@item.attendee = current_user
		@item.save
		redirect_to party_path(@party)
	end

	def show
		@item = Item.find(params[:id])
	end
end
