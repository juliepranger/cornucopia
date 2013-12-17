class Item < ActiveRecord::Base
	belongs_to :party
	belongs_to :attendee, class_name: "User", inverse_of: :item
end
