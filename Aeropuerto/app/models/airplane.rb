require_relative 'base.rb'

class Airplane < Base
	
	attr_accessor :model, :code, :company, :id, :created_at, :updated_at,:url
 
	validates :model, presence: true
	validates :code, presence: true
	validates :company, presence: true

private 

	def self.endpoint
		'airplanes'	
	end

	def to_json
		{ 
			airplane: {
				id: self.id,
				model: self.model,
				code: self.code,
				company: self.company
			}
		}
	end
end

