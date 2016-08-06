json.extract! token, :id, :token, :name, :number_request, :active, :created_at, :updated_at
json.url token_url(token, format: :json)