class DropServesFromRecipes < ActiveRecord::Migration
  def change
  	remove_column :recipes, :serves
  end
end
