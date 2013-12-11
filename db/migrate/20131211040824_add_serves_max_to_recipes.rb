class AddServesMaxToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :serves_max, :integer
  end
end
