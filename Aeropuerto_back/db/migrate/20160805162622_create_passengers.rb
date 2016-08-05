class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :identification
      t.string :phone
      t.string :email
      t.string :address

      t.timestamps null: false
    end
  end
end
