class Attendee < ActiveRecord::Base

	belongs_to :party
	has_one :item, class_name: "Item", inverse_of: :attendee

	def new
		@attendee = Attendee.new
	end

	def invite(attendee)
		@attendee = Attendee.new(params[:attendee].permit(:name, :email, :id, :item))

	end

	def sort()
		if :rsvp 
		else
		end
	end

end
