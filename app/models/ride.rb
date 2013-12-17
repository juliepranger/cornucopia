class Ride < ActiveRecord::Base
	belongs_to :user
	belongs_to :party

	scope :need_ride, where(need_ride: true)
end
