class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.boolean :need_ride
      t.string :name
      t.string :need_ride_location

      t.timestamps
    end
  end
end
