class AddTokenToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :token, :string
  end
end
