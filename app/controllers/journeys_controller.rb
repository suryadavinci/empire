class JourneysController < ApplicationController
  before_action :set_journey, only: [:show, :edit, :update, :destroy]

  # GET /journeys
  # GET /journeys.json
  def index
    if(journey_params.empty?)
      @journeys = Journey.all
    else
      @journeys = Journey.where(journey_params)
    end
    if @journeys.empty?
      flash[:warning] ="No Travels/Busses found"
      redirect_to root_path
    end
    #redirect_to request.referrer
    #render root_path
    #render 'static_pages/home'

  end

  # GET /journeys/1
  # GET /journeys/1.json
  def show
    @booking = @journey.bookings.build
  end

  # GET /journeys/new
  def new
    @buses = Bus.all
    @destinations = Destination.all
    @journey = Journey.new
  end

  # GET /journeys/1/edit
  def edit
    @buses = Bus.all
    @destinations = Destination.all
  end

  # POST /journeys
  # POST /journeys.json
  def create
    @journey = Journey.new(journey_params)
    respond_to do |format|
      if @journey.save
        format.html { redirect_to @journey, notice: 'Journey was successfully created.' }
        format.json { render :show, status: :created, location: @journey }
      else

        @buses = Bus.all
        @destinations = Destination.all

         format.html { render :new }
         format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journeys/1
  # PATCH/PUT /journeys/1.json
  def update
    respond_to do |format|
      if @journey.update(journey_params)
        format.html { redirect_to @journey, notice: 'Journey was successfully updated.' }
        format.json { render :show, status: :ok, location: @journey }
      else
        format.html { render :edit }
        format.json { render json: @journey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journeys/1
  # DELETE /journeys/1.json
  def destroy
    @journey.destroy
    respond_to do |format|
      format.html { redirect_to journeys_url, notice: 'Journey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def book

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journey
      @journey = Journey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journey_params
      params.require(:journey).permit(:name, :bus_id, :departure_time, :arrival_time, :from_id, :to_id)
    end
end
