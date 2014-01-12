class AttendeesMailer < ActionMailer::Base
	default from: "from@example.com"

	def attendee_invite_notification(party)
		@party = party
		@party.attendees.each do |p|
			send_invite(p).deliver
		end
	end

	def send_invite(p)
		@token = p.token
		mail to: p.email, subject: "You're invited to #{@party.name}!"
	end

end