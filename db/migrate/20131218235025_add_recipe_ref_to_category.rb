class AddRecipeRefToCategory < ActiveRecord::Migration
  def change
    add_reference :categories, :recipe, index: true
  end
end
