class TransportsController < ApplicationController
  before_action :set_transport, only: [:show, :edit, :update, :destroy]

  # GET /transports
  # GET /transports.json
  def index
    @transports = Transport.all.includes(:bus,:from,:to)
  end

  # GET /transports/1
  # GET /transports/1.json
  def show
  #  @transport.includes(:bus,:from,:to)
  @booking = Booking.new(:departure_date => params[:departure_date])

  end

  # GET /transports/new
  def new
    @buses = Bus.all
    @destinations = Destination.all
    @transport = Transport.new
    # @type =  select( "payment", "id", { "Sunday" => "0", "Monday" => "1"})
  end

  # GET /transports/1/edit
  def edit
  end

  # POST /transports
  # POST /transports.json
  def create
    p "Printing "

    @transport = Transport.new(transport_params)
    p "Printing #{@transport}"

    respond_to do |format|
      if @transport.save
        flash[:success] = 'Transport was successfully created.';
        format.html { redirect_to @transport}
        format.json { render :show, status: :created, location: @transport }
      else
        format.html { render :new }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transports/1
  # PATCH/PUT /transports/1.json
  def update
    respond_to do |format|
      if @transport.update(transport_params)
        flash[:success] = 'Transport was successfully updated.' ;
        format.html { redirect_to @transport}
        format.json { render :show, status: :ok, location: @transport }
      else
        format.html { render :edit }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @transports = Transport.where("from_id = ? and to_id = ? and ((start_date = ? and recurrence =0) or (start_date <= ? and recurrence =1 and end_date > ?)) ",search_params[:from_id], search_params[:to_id], search_params[:start_date], search_params[:start_date],search_params[:start_date]).includes(:from,:to)
    @departure_date = search_params[:start_date]
    #render @transports
  end
  # DELETE /transports/1
  # DELETE /transports/1.json
  def destroy
    @transport.destroy
    respond_to do |format|
      flash[:success] = 'Transport was successfully destroyed.' ;
      format.html { redirect_to transports_url }
      format.json { head :no_content }
    end
  end



  def book
  #  @transport.includes(:bus,:from,:to)
  @booking = @transport.bookings.build(departure_date: params[:departure_date])

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transport
      @transport = Transport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transport_params
      params.require(:transport).permit(:name,:bus_id, :from_id, :to_id, :start_date, :end_date, :departure_time, :arrival_time, :recurrence,:cost)
    end

    def search_params
      params.require(:transport).permit(:from_id, :to_id,:start_date)
    end

end
