class Passenger


include ActiveModel::Model#Es para usar el first, create, save que se pone cuando se hace por scaffold

 	BASE_URL = 'http://localhost:3000/'
 	TOKEN = '428ae8d1-8b80-4739-ad26-78b0e6e89a5a';

	def persisted?
		self.id.present?
	end


	attr_accessor :id, :name, :identification, :phone, :email, :address, :created_at, :updated_at,:url

	validates :name, presence: true
	validates :identification, presence: true
	validates :phone, presence: true
	validates :email, presence: true
    validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	def self.path (request_path = "")
		BASE_URL + self.endpoint + request_path + '.json'
	end


	def self.all
		response = HTTParty.get(self.path, headers: { 'token' => TOKEN })
		response.parsed_response.map do |movie|
			new(movie)
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
		p '-------------------------------'
		p to_json
		HTTParty.post(self.class.path, query: to_json, headers: { 'token' => TOKEN })
	end


	def destroy
		HTTParty.delete(self.class.path("/#{id}"), headers: { 'token' => TOKEN })
	end


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
				address: self.address
			}
		}
	end
end