class Party < ActiveRecord::Base
	has_many :rides
	has_and_belongs_to_many :users
	has_and_belongs_to_many :attendees
	belongs_to :host, class_name: "User"
	has_many :items
end
