class AddPartyidToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :party_id, :string
  end
end
