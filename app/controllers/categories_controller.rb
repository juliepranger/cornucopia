class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		 @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render action: 'show', status: :created, location: @category }
      else
        format.html { render action: 'new' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
	end

	def show
		@category = Category.find(params[:id])
		@recipes = @category.recipes
    respond_to do |format|
      format.json { render :json => params }
      format.html
    end
	end

	private

	def category_params
		params.require(:recipe).permit(
			:drinks,
			:appetizer,
			:salad,
			:side_dish,
			:main_dish,
			:dessert
			)
	end
end
