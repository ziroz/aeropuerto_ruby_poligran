json.extract! passenger, :id, :name, :identification, :email, :phone, :address, :created_at, :updated_at
json.url passenger_url(passenger, format: :json)