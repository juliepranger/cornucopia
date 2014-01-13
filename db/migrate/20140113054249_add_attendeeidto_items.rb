class AddAttendeeidtoItems < ActiveRecord::Migration
  def change
  	add_column :items, :attendee_id, :integer
  	add_column :items, :party_id, :integer
  end
end
