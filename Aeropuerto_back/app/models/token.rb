# == Schema Information
#
# Table name: tokens
#
#  id                :integer          not null, primary key
#  token             :string
#  name              :string
#  number_of_request :integer          default(0)
#  active            :boolean          default(TRUE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

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
