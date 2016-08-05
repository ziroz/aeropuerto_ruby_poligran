# == Schema Information
#
# Table name: flights
#
#  id          :integer          not null, primary key
#  origin      :string
#  destiny     :string
#  date        :datetime
#  airplane_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Flight < ActiveRecord::Base
  	belongs_to :airplane
	has_many :passenger_flight
  
	validates :origin, precense: true
	validates :destiny, precense: true
	validates :date, precense: true
	validates :airplane_id, precense: true

end
