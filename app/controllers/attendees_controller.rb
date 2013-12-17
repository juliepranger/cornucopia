class AttendeesController < ApplicationController
	skip_before_action :require_login, only:[:show, :index]

	def index	#show all attendees (for a specific party), only those invited to party can view
		@attendees = Attendee.all
	end

	def create_attendee_access
		if current_user == :userid
			redirect_to :action => 'show', :id =>@attendee._id
		else
			flash[:notice] = "Uh oh, you're not signed in!"
		end
	end

	def show # who is the attendee in question
		@attendee = Attendee.new
		@attendee.save
		@party.attendees.all = :guest_list
	end

	def new
		@attendee = Attendee.new
		@party = Party.find(params[:format])
	end

	def create
		@attendee = Attendee.new(params[:attendee].permit(:name, :email, :party_id))
		@attendee.party = Party.find(@attendee.party_id)
		@attendee.save
		redirect_to party_url(@attendee.party_id)
	end


	def destroy 								#canceling your invite, can't go to party?
		Attendee.find(params[:id]).destroy		# is this the same as def rsvp = false ?
		redirect_to attendees_url
	end 		
end
