class AddPartyIdToRides < ActiveRecord::Migration
  def change
    add_column :rides, :party_id, :integer
  end
end
