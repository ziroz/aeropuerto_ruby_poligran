class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :origin
      t.string :destiny
      t.datetime :date
      t.references :airplane, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
