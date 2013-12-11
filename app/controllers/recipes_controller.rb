class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all
	end

	def import
		@recipes = Roo::Excelx.new '/Users/juliepranger/Documents/wdi/cornucopia/RecipeListCornucopia.xlsx'
		((@recipes.first_row+1)..@recipes.last_row).each do |rowNum|
		# set up the serves range - ignore the non-numerical characteristics	
			num = @recipes.cell(rowNum, 2)
			time = @recipes.cell(rowNum, 3)
			num = num.to_i if num.kind_of?(Float) #make sure floats are integers
			num = num.to_s #cell info is a string, not
			isNum = false  #an integer
			result = "" #setting the stage for later

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

			


			Recipe.create(name: @recipes.cell(rowNum, 1),
			 serves: result.to_i, 
			 serves_max: resultLast.to_i,
			 total_time: end_result
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
