class Airplane < ActiveRecord::Base
	validates :model, presence: true
	validates :code, presence: true, uniqueness: true
	validates :company, presence: true
end
