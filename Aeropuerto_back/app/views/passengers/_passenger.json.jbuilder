json.extract! passenger, :id, :name, :identification, :phone, :email, :address, :created_at, :updated_at
json.url passenger_url(passenger, format: :json)