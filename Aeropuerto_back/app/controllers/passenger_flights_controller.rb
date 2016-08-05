class PassengerFlightsController < ApplicationController
  before_action :set_passenger_flight, only: [:show, :edit, :update, :destroy]

  # GET /passenger_flights
  # GET /passenger_flights.json
  def index
    @passenger_flights = PassengerFlight.all
  end

  # GET /passenger_flights/1
  # GET /passenger_flights/1.json
  def show
  end

  # GET /passenger_flights/new
  def new
    @passenger_flight = PassengerFlight.new
  end

  # GET /passenger_flights/1/edit
  def edit
  end

  # POST /passenger_flights
  # POST /passenger_flights.json
  def create
    @passenger_flight = PassengerFlight.new(passenger_flight_params)

    respond_to do |format|
      if @passenger_flight.save
        format.html { redirect_to @passenger_flight, notice: 'Passenger flight was successfully created.' }
        format.json { render :show, status: :created, location: @passenger_flight }
      else
        format.html { render :new }
        format.json { render json: @passenger_flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passenger_flights/1
  # PATCH/PUT /passenger_flights/1.json
  def update
    respond_to do |format|
      if @passenger_flight.update(passenger_flight_params)
        format.html { redirect_to @passenger_flight, notice: 'Passenger flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @passenger_flight }
      else
        format.html { render :edit }
        format.json { render json: @passenger_flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passenger_flights/1
  # DELETE /passenger_flights/1.json
  def destroy
    @passenger_flight.destroy
    respond_to do |format|
      format.html { redirect_to passenger_flights_url, notice: 'Passenger flight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger_flight
      @passenger_flight = PassengerFlight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def passenger_flight_params
      params.require(:passenger_flight).permit(:passenger_id, :flight_id)
    end
end
