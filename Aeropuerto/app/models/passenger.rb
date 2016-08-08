require_relative 'base.rb'

class Passenger  < Base

	attr_accessor :id, :name, :flight_id, :identification, :phone, :email, :address, :created_at, :updated_at,:url

	validates :name, presence: true
	validates :identification, presence: true
	validates :phone, presence: true
	validates :email, presence: true
    validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	def self.endpoint
		'passengers'
	end

	def to_json
		{
			passenger: {
				id: self.id,
				name: self.name,
				identification: self.identification,
				phone: self.phone,
				email: self.email,
				address: self.address,
				flight_id: self.flight_id
			}
		}
	end
end