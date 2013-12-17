class AddGuestlistToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :guest_list, :string
  end
end
