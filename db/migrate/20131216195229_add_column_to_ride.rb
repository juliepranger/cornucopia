class AddColumnToRide < ActiveRecord::Migration
  def change
    add_column :rides, :lat, :string
    add_column :rides, :lng, :string
    add_column :rides, :date, :string
  end
end
