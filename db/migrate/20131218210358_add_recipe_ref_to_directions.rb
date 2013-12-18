class AddRecipeRefToDirections < ActiveRecord::Migration
  def change
    add_reference :directions, :recipe, index: true
  end
end
