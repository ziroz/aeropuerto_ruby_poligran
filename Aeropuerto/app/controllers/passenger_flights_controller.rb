class PassengerFlightsController < ApplicationController
  before_action :logged_in?
  before_action :set_passenger_flight, only: [:destroy]

  # GET /passenger_flights
  # GET /passenger_flights.json
  def index
    @passenger_flights = PassengerFlight.findAll(params[:id])
    @flight = Flight.find(params[:id])
  end

  # DELETE /passenger_flights/1
  # DELETE /passenger_flights/1.json
  def destroy
    @passenger_flight.passenger.destroy
    @passenger_flight.destroy
    respond_to do |format|
      format.html { redirect_to passenger_flights_url(@passenger_flight.flight_id), notice: 'Passenger flight was successfully destroyed.' }
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
