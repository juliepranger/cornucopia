class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all
	end

	def import
		current_recipe = nil # where are we in our list of ingredients?

		@recipes = Roo::Excelx.new '/Users/juliepranger/Documents/wdi/cornucopia/RecipeListCornucopia.xlsx'
		((@recipes.first_row+1)..@recipes.last_row).each do |rowNum|
		# set up the serves range - ignore the non-numerical characteristics	
			num = @recipes.cell(rowNum, 2)
			time = @recipes.cell(rowNum, 3)
			num = num.to_i if num.kind_of?(Float) #make sure floats are integers
			num = num.to_s #cell info is a string, not
			isNum = false  #an integer
			result = "" #setting the stage for later

			recipe_name = @recipes.cell(rowNum, 1)


			if recipe_name && recipe_name.length > 0

				# run through the string, front to end, find resulting num (result)
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
				numr = num.reverse
				
				# run through the string, front to back, find resultLast (also num)
				for i in (0..num.length-1)
					if numr[i] >= "0" && numr[i] <= "9"
						isNum = true
						resultLast = numr[i] + resultLast
					else
						break if isNum
					end
				end

				if result == ""
					result = @recipes.cell(rowNum, 2)
				end

				# import the hour and min information in, convert everything to minutes
					# set the stage with flags; converting spaces to individual tokens
					end_result = 0
					time = time.split(' ')
					num_flag = -1
				for i in(0..time.length-1)
					 if time[i].is_i?
						num_flag = time[i].to_i 
					 elsif (time[i] == "min") || (time[i] == "mins") || (time[i] == "minutes") || (time[i] == "min.")  && num_flag != -1 # make sure all possible entries in your spreadsheet are covered
						end_result += num_flag
						num_flag = -1
					elsif (time[i] == "hr") || (time[i] == "hour") || (time[i] == "hours") || (time[i] == "hrs") || (time[i] == "hr.") || (time[i] == "hrs.") && num_flag != -1 # make sure these are covered, too!
						end_result += num_flag * 60 # convert all time to minutes
						num_flag = -1
					end
				end
				puts end_result

				current_recipe = Recipe.create(name: recipe_name,
				 serves: result, 
				 serves_max: resultLast.to_i,
				 total_time: end_result
				 )
			end

			if !current_recipe
				puts "TROUBLE!!!!" # + recipe_name
			else
				quantity = 0
				unit_measure = ""
				prefix = ""	
				ingredient = @recipes.cell(rowNum, 4)
				break if !ingredient
				ingredient.strip!

				if ingredient[-1, 1] == ":"
					prefix = ingredient + " "
				else
					ingredient_rows = ingredient.split('\n')
					if ingredient_rows.count > 1
						puts ingredient_rows.count.to_s
					end
					ingredient_rows.each do |r|
						ingredient_array = r.split(' ')
						for i in (0..ingredient_array.length)
							if ingredient_array[i].include?('/')
								quantity_array = ingredient_array[i].split('/')
								quantity += quantity_array[0].to_f / quantity_array[1].to_f
							elsif ingredient_array[i].is_f?
								quantity += ingredient_array[i].to_f
							else
								ingredient = ingredient_array[i..ingredient_array.length-1].join(' ') + prefix
								break
							end
						end
					end
				end
				if ingredient.length > 255
					ingredient = ingredient[0..254]
				end
				ingredient_object = Ingredient.find_or_create_by(:ingredient_name => ingredient)
				current_recipe.ingredient_recipes.create(quantity:quantity, ingredient:ingredient_object)
			end

	
			
		end
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.create(recipe_params)
		redirect_to recipes_url	
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	private

		def recipe_params
			params.require(:recipe).permit(
				:name,
				:serves,
				:total_time,
				:quantity,
				:unit_measure,
				:ingredients
				)
		end

end
