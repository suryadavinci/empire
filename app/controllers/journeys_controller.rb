class JourneysController < ApplicationController
  before_action :set_journey, only: [:show, :edit, :update, :destroy]
  before_action :admin_user, only: [ :edit, :update, :destroy]
  # GET /journeys
  # GET /journeys.json
  def index
  #  if(params.empty?)

      @journeys = Journey.all
      #            if search_params
      #              Journey.where("from_id = ? and to_id = ? and  departure_time >= ? ",search_params[:from_id], search_params[:to_id], search_params[:departure_time])
      #            else

      #            end

      #@destinations = Destination.order(:name)
      #@journey = Journey.new
  #  else
  #    @journeys = Journey.where(journey_params)
  #  end
    if @journeys.empty?
      flash[:warning] ="No Travels/Busses found"
      redirect_to root_path
    end
  #  p "its here"
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
        flash[:success]="#{@journey.name} was successfully created"

        format.html { redirect_to @journey}
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
        flash[:success]="#{@journey.name} was successfully updated"
        format.html { redirect_to @journey }
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
      flash[:success]="#{@journey.name} was successfully destroyed"

      format.html { redirect_to journeys_url }
      format.json { head :no_content }
    end
  end

  def search
    #@journeys = Journey.where('departure_time > ?', search_params[:departure_time])
    puts "printing params"
    puts params
    puts params[:departure_time]
    puts search_params[:from_id]
    #date = search_params[:departure_time]+1
    #time = Time.zone.at(date.to_time).to_datetime

  #  search_params[:departure_time] = time
  #  puts search_params[:departure_time]
    #puts Date.parse(params[:departure_time].to_s)
    #@journeys = Journey.where(search_params)
  #  @journeys = Journey.where(from_id: search_params[:from_id], to_id: search_params[:to_id]).where("departure_time >= ?", search_params[:departure_time])
    #.where("departure_time < ?", (search_params[:departure_time]+1))
    #where("user_id = ? AND notetype = ? AND date > ?", current_user.id, p[:note_type], p[:date]).
     #order('date ASC, created_at ASC')

     @journeys = Journey.where("from_id = ? and to_id = ? and  departure_time >= ? ",search_params[:from_id], search_params[:to_id], search_params[:departure_time])
     #render @journeys

    # redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journey
      @journey = Journey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journey_params

      params.require(:journey).permit(:name, :bus_id, :departure_time, :arrival_time, :from_id, :to_id, :cost)
    end

    def search_params

      # params[:departure_time] = Time.new(params["departure_time(1i)"].to_i, params["departure_time(2i)"].to_i,
      #                         params["departure_time(3i)"].to_i, params["departure_time(4i)"].to_i,
      #                         params["departure_time(5i)"].to_i)
      #params[:departure_time] = params[:departure_date].to_datetime
      # params[:departure_time]
      params.require(:journey).permit(:from_id, :to_id,:departure_time)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
