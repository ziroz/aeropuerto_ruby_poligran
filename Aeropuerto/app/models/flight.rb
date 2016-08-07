require_relative 'base.rb'

class Flight < Base
	attr_accessor :id, :origin, :destiny, :airplane, :airplane_id, :date, :created_at, :updated_at,:url
 
	validates :origin, presence: true
	validates :destiny, presence: true
	validates :date, presence: true
	validates :airplane_id, presence: true

	def passengers
		PassengerFlight.find(flight_id: self.id)
	end

private 

	def self.endpoint
		'flights'	
	end

	def to_json
		{ 
			flight: {
				id: self.id,
				origin: self.origin,
				destiny: self.destiny,
				airplane_id: self.airplane_id,
				date: self.date
			}
		}
	end
end

