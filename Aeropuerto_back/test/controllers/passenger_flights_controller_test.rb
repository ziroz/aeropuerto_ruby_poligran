require 'test_helper'

class PassengerFlightsControllerTest < ActionController::TestCase
  setup do
    @passenger_flight = passenger_flights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:passenger_flights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create passenger_flight" do
    assert_difference('PassengerFlight.count') do
      post :create, passenger_flight: { flight_id: @passenger_flight.flight_id, passenger_id: @passenger_flight.passenger_id }
    end

    assert_redirected_to passenger_flight_path(assigns(:passenger_flight))
  end

  test "should show passenger_flight" do
    get :show, id: @passenger_flight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @passenger_flight
    assert_response :success
  end

  test "should update passenger_flight" do
    patch :update, id: @passenger_flight, passenger_flight: { flight_id: @passenger_flight.flight_id, passenger_id: @passenger_flight.passenger_id }
    assert_redirected_to passenger_flight_path(assigns(:passenger_flight))
  end

  test "should destroy passenger_flight" do
    assert_difference('PassengerFlight.count', -1) do
      delete :destroy, id: @passenger_flight
    end

    assert_redirected_to passenger_flights_path
  end
end
