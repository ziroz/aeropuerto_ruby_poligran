class Token < ActiveRecord::Base
	before_create :asignar_token

	private
	def asignar_token
		self.token = SecureRandom.uuid
	end

	def self.authenticate(auth_token)
		find_by token: auth_token
	end
end
