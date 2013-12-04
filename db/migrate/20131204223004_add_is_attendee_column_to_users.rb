class AddIsAttendeeColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_attendee, :boolean
  end
end
