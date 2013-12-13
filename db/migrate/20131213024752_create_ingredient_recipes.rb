class CreateIngredientRecipes < ActiveRecord::Migration
  def change
    create_table :ingredient_recipes do |t|
      t.references :recipe, index: true
      t.references :ingredient, index: true
      t.float :quantity
      t.string :unit_measure

      t.timestamps
    end
  end
end
