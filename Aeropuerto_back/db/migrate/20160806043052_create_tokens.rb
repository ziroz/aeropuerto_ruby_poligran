class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :token
      t.string :name
      t.integer :number_request, dafault: 0
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
