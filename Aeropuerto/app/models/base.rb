
require 'active_model'

class Base
	include ActiveModel::Model#Es para usar el first, create, save que se pone cuando se hace por scaffold
  	include ActiveModel::Validations

 	BASE_URL = 'http://localhost:3000/'
 	TOKEN = '428ae8d1-8b80-4739-ad26-78b0e6e89a5a';

	def persisted?
		self.id.present?
	end

	def self.endpoint
		raise 'Not implemented' #raise es para lanzar una excepción
	end


	def self.path (request_path = "")
		BASE_URL + self.endpoint + request_path + '.json'
	end


	def self.all
		response = HTTParty.get(self.path, headers: { 'token' => TOKEN })
		response.parsed_response.map do |item|
			new(item)
		end
	end


	def self.find(id)
		response = HTTParty.get(self.path("/#{id}"), headers: { 'token' => TOKEN })
		new(response.parsed_response)
	end


	def update
		HTTParty.put(self.class.path("/#{id}"), query: to_json, headers: { 'token' => TOKEN })
	end


	def save
		p '-----------gddf fgh fdh dffh gh-----------------------'
		p to_json
		HTTParty.post(self.class.path, query: to_json, headers: { 'token' => TOKEN })
	end


	def destroy
		HTTParty.delete(self.class.path("/#{id}"), headers: { 'token' => TOKEN })
	end

	def self.check_response(response)
		#if response.code != 200
		#	raise response.error
		#end
	end
end