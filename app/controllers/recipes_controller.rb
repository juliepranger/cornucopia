class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all
	end

	def import
		@recipes = Roo::Excelx.new '/Users/juliepranger/Documents/wdi/cornucopia/RecipeListCornucopia.xlsx'
		((@recipes.first_row+1)..@recipes.last_row).each do |rowNum|
		# set up the serves range - ignore the non-numerical characteristics	
			num = @recipes.cell(rowNum, 2)
			num = num.to_i if num.kind_of?(Float)
			num = num.to_s
			isNum = false
			result = ""

			for i in (0..num.length-1)
				if num[i] >= "0" && num[i] <= "9"
					isNum = true
					result += num[i]
				else
					break if isNum
				end
			end

			isNum = false
			resultLast = ""
			num = num.reverse
			
			for i in (0..num.length-1)
				if num[i] >= "0" && num[i] <= "9"
					isNum = true
					resultLast = num[i] + resultLast
				else
					break if isNum
				end
			end

			Recipe.create(name: @recipes.cell(rowNum, 1),
			 serves: result.to_i, 
			 serves_max: resultLast.to_i
			 # ,total_time: @recipes.cell(rowNum, 3)
			 )
			
		end
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.create(recipe_params)
		redirect_to recipes_url	
	end

	private

		def recipe_params
			params.require(:recipe).permit(
				:name,
				:serves,
				:total_time
				)
		end

end
