class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.date :birth_date
      t.string :status
      t.string :boolean
      t.string :avatar_url
      t.string :phone
      t.string :identification

      t.timestamps null: false
    end
  end
end
