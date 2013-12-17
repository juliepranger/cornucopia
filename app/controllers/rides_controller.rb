class RidesController < ApplicationController
	before_action :set_ride, only: [:show, :edit, :update, :destroy]
	respond_to :html, :json

def new
	@ride = Ride.new
end

def create
	@ride = Ride.new(name: params[:name], lat: params[:lat], lng: params[:lng], date: params[:date])
    if @ride.save!
      render :status => :ok, :json => { status: 'SUCCESS', url: ride_path(@ride) }
  	else
      render :status => 422, :json => { status: 'FAILED' }
 		end
end

def show
	respond_with(@ride)
end

private

  def set_ride
    @ride = Ride.find(params[:id])
  end

	def ride_params
		params.require(:ride).permit(
			:need_ride, 
			:name, 
			:need_ride_location,
			:lat,
			:lng,
			:date
			)
	end

end
