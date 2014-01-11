class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only:[:show, :index]

  # GET /parties
  # GET /parties.json
  def index
    @parties = Party.all
  end

  def create_party_access
    if current_user == :userid
      redirect_to :action => 'show', :id =>@party._id
    else
      flash[:notice] = "Uh oh, you're not signed in!"
    end
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
    @party = Party.find(params[:id])
    # @rides = Ride.find(params[:id])
    respond_to do |format|
      format.json { render :json => params }
      format.html
    end
  end

  # GET /parties/new
  def new
    @party = Party.new
  end

  # GET /parties/1/edit
  def edit
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new(party_params)
    


    respond_to do |format|
      if @party.save
        @guestlist = params.require(:party).permit(:guest_list, :id)
          @attendees = @guestlist[:guest_list].split(',')
          @attendees.each do |email|
            @attendee = Attendee.where(:email => email).first_or_create(:rsvp => nil,
                                                                        :token => SecureRandom.urlsafe_base64)
            @party.attendees << @attendee
          end
        format.html { redirect_to @party, notice: 'Party was successfully created.' }
        format.json { render action: 'show', status: :created, location: @party }
      else
        format.html { render action: 'new' }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    @party.host = current_user
    end
  end

  # PATCH/PUT /parties/1
  # PATCH/PUT /parties/1.json
  def update
    respond_to do |format|
      if @party.update(party_params)
        format.html { redirect_to @party, notice: 'Party was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  def destroy
    @party = Party.find(params[:id]).destroy
    redirect_to parties_url
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_party
      @party = Party.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def party_params
      params.require(:party).permit(:name, :date, :location, :email, :userid, :host_id, :guest_list)
    end
end
