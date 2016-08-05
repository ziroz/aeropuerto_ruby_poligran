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

class PassengerFlight < ActiveRecord::Base
  belongs_to :passenger
  belongs_to :flight
end
