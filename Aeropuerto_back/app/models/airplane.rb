# == Schema Information
#
# Table name: airplanes
#
#  id         :integer          not null, primary key
#  model      :string
#  code       :string
#  company    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Airplane < ActiveRecord::Base

	has_many :flights

	validates :model, presence: true
	validates :code, presence: true, uniqueness: true
	validates :company, presence: true

end
