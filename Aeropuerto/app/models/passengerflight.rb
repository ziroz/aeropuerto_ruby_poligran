require_relative 'base.rb'

class PassengerFlight < Base
	attr_accessor :id, :passenger_id, :flight_id, :passenger, :flight, :created_at, :updated_at,:url

	

private 

	def self.endpoint
		'passengerflights'	
	end

	def to_json
		{ 
			passengerflight: {
				id: self.id,
				passenger_id: self.passenger_id,
				flight_id: self.flight_id
			}
		}
	end
end