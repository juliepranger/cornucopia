class Party < ActiveRecord::Base
	has_many :rides
	has_and_belongs_to_many :users
	
	belongs_to :host, class_name: "User"
end
