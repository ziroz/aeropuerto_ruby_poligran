# == Schema Information
#
# Table name: passenger_flights
#
#  id           :integer          not null, primary key
#  passenger_id :integer
#  flight_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class PassengerFlightTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
