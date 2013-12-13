class AddUnitMeasureToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes, :quantity, :float
    add_column :recipes, :unit_measure, :string
  end
end
