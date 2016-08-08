require_relative 'base.rb'

class Flight < Base
	attr_accessor :id, :origin, :destiny, :airplane_id, :date, :created_at, :updated_at,:url

	validates :origin, presence: true
	validates :destiny, presence: true
	validates :date, presence: true
	validates :airplane_id, presence: true

	def passengers
		p PassengerFlight.findAll(self.id)
	end

	def airplane
		Airplane.find(self.airplane_id)
	end

	def countries
		'[{ "name": "Bógota" },{ "name": "Medellín"	},{ "name": "Cartagena"	},{ "name": "Cali"	}]'
	end

	def date_flight
		DateTime.parse(self.date).strftime('%d-%m-%Y %I:%M %p')
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
				date: DateTime.parse(self.date).strftime
			}
		}
	end
end

