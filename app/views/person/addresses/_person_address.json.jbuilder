json.extract! person_address, :id, :street, :town, :zip_code, :state, :country, :person_id, :created_at, :updated_at
json.url person_address_url(person_address, format: :json)
