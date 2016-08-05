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

require 'test_helper'

class AirplaneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
