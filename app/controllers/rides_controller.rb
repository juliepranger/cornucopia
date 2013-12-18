class RidesController < ApplicationController
	before_action :set_ride, only: [:show, :edit, :update, :destroy]
	skip_before_action :require_login, only:[:show, :index]
	respond_to :html, :json

def new
	@ride = Ride.new
end

def create_ride_access
		if current_user == :userid
			redirect_to :action => 'show', :id =>@party._id
		else
			flash[:notice] = "Uh oh, you're not signed in!"
		end
	end

def create
	@party = Party.find(params[:id])
	logger.info @party.inspect
	@ride = @party.rides.new(name: params[:name], lat: params[:lat], lng: params[:lng], date: params[:date], need_ride_location: params[:location])
    if @ride.save!
      render :status => :ok, :json => { status: 'SUCCESS', url: party_path(@party) }
  	else
      render :status => 422, :json => { status: 'FAILED' }
 		end
end

def show
	
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
			:date,
			:party_id
			)
	end

end
