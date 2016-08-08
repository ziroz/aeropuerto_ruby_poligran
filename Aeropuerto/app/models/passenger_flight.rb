require_relative 'base.rb'

class PassengerFlight < Base
	attr_accessor :id, :passenger_id, :flight_id, :created_at, :updated_at,:url


	def self.find_by_passenger(id)
		response = HTTParty.get(self.path("/index/#{id}"), headers: { 'token' => TOKEN })
		response.parsed_response.map do |item|
			new(item)
		end
	end

	def self.findAll(id)
		response = HTTParty.get(self.path("/#{id}"), headers: { 'token' => TOKEN })
		response.parsed_response.map do |item|
			new(item)
		end
	end

	def passenger
		Passenger.find(self.passenger_id)
	end

	private

	def self.endpoint
		'passenger_flights'
	end

	def to_json
		{
			passenger_flight: {
				id: self.id,
				passenger_id: self.passenger_id,
				flight_id: self.flight_id
			}
		}
	end
end