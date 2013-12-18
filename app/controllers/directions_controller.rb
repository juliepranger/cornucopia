class DirectionsController < ApplicationController

	def create
		@direction = Direction.create(direction_params)
	end

	def show
	end

	private

	def direction_params
		params.require(:direction).permit(
			:direction_num,
			:instruction
			)
	end

end
