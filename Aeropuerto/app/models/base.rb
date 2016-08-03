class Base
	include ActiveModel::Model#Es para usar el first, create, save que se pone cuando se hace por scaffold

 	BASE_URL = 'http://localhost:3000/'

	def persisted?
		self.id.present?
	end

	def self.token
		raise 'Not implemented' #raise es para lanzar una excepción
	end


	def self.endpoint
		raise 'Not implemented' #raise es para lanzar una excepción
	end


	def self.path (request_path = "")
		BASE_URL + self.endpoint + request_path + '.json'
	end


	def self.all
		response = HTTParty.get(self.path, headers: { 'token' => self.token })
		response.parsed_response.map do |movie|
			new(movie)
		end
	end


	def self.find(id)
		response = HTTParty.get(self.path("/#{id}"), headers: { 'token' => self.token })
		new(response.parsed_response)
	end


	def update
		p '-------------------------------'
		p to_json
		HTTParty.put(self.class.path("/#{id}"), query: to_json, headers: { 'token' => self.class.token })
	end


	def save
		HTTParty.post(self.class.path, query: to_json, headers: { 'token' => self.class.token })
	end


	def destroy
		HTTParty.delete(self.class.path("/#{id}"), headers: { 'token' => self.class.token })
	end

end