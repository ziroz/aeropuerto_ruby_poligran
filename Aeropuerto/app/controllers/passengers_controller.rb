class PassengersController < ApplicationController
  before_action :logged_in?, only: [:index, :show, :update, :destroy]
  before_action :set_passenger, only: [:show, :edit, :destroy]

  # GET /passengers/1
  # GET /passengers/1.json
  def show
  end

  # GET /passengers/new
  def new
    @passenger = Passenger.new
    @passenger.flight_id = params[:id]
  end

  # GET /passengers/1/edit
  def edit
  end

  # POST /passengers
  # POST /passengers.json
  def create

    @passenger = Passenger.new(passenger_params)
    respond_to do |format|
      if @passenger.save
        format.html { redirect_to passenger_show_path(Passenger.all.last.id), notice: 'Passenger was successfully created.' }
        format.json { render :show, status: :created, location: @passenger }
      else
        format.html { render :new }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passengers/1
  # PATCH/PUT /passengers/1.json
  def update
    @passenger = Passenger.new(passenger_params)
    p '-------------------sddgf-'
    p params
    respond_to do |format|
      if @passenger.update
        format.html { redirect_to passenger_show_path(@passenger.id), notice: 'Passenger was successfully updated.' }
        format.json { render :show, status: :ok, location: @passenger }
      else
        format.html { render :edit }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passengers/1
  # DELETE /passengers/1.json
  def destroy
    PassengerFlight.find_by_passenger(@passenger.id).first.destroy
    @passenger.destroy
    respond_to do |format|
      format.html { redirect_to passenger_flights_show_path(@passenger.flight_id), notice: 'Passenger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
      @passenger.flight_id = PassengerFlight.find_by_passenger(@passenger.id).first.flight_id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def passenger_params
      params.require(:passenger).permit(:id, :name, :identification, :email, :phone, :address, :flight_id)
    end
end
