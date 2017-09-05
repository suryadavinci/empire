class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = current_user.bookings.all.includes(:journey)
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show

    @passengers = @booking.passengers
    # if(@passengers.count == 0)
    #   @passengers = []
    # end
  end

  # GET /bookings/new
  def new
    @journeys = Journey.all
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    # @booking = Booking.new(booking_params)
    #@available_seats = Bus.find(:id Journey.find_by(id: booking_params[:journey_id]).bus_id).max_seats -  Booking.where(journey_id: booking_params[:journey_id]).sum(:seats_count)
    #@available_seats
    p booking_params
#    booking_params[:status] = "Pending"
    @booking = current_user.bookings.build(booking_params)
    @booking.status ="Pending"
    respond_to do |format|
      if @booking.save
        flash[:success] = "Booking Successful!!! Now enter passenger details."
        format.html { redirect_to @booking}
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        flash[:success] = "Booking Updated Successful"
        format.html { redirect_to @booking}
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    booking = @booking
    @booking.destroy
    respond_to do |format|
      flash[:success] = "Your Booking was Cancelled Successfully"
      format.html { redirect_to bookings_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:journey_id, :seats_count)
    end


end
