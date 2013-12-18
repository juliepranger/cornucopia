class Recipe < ActiveRecord::Base
	has_many :ingredient_recipes
	has_many :ingredients, through: :ingredient_recipes, source: :ingredient
	has_many :directions
end
