class AddColumnsToItem < ActiveRecord::Migration
  def change
    add_column :items, :food_type, :string
    add_column :items, :food_name, :string
  end
end
