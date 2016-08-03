class CreateAirplanes < ActiveRecord::Migration
  def change
    create_table :airplanes do |t|
      t.string :model
      t.string :code
      t.string :company

      t.timestamps null: false
    end
  end
end
