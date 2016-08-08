# == Schema Information
#
# Table name: passengers
#
#  id             :integer          not null, primary key
#  name           :string
#  identification :string
#  phone          :string
#  email          :string
#  address        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Passenger < ActiveRecord::Base
	has_many :passenger_flight
	attr_accessor :flight_id
	validates :name, presence: true
	validates :identification, presence: true
	validates :phone, presence: true
	validates :email, presence: true
    validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
end
