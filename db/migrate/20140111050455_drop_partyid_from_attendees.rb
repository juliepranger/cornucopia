class DropPartyidFromAttendees < ActiveRecord::Migration
  def change
  	remove_column :attendees, :party_id
  end
end
