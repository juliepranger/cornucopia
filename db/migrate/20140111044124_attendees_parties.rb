class AttendeesParties < ActiveRecord::Migration
  def change
  	create_table :attendees_parties, id:false do |t|
      t.belongs_to :attendee
      t.belongs_to :party
   end
  end
end
