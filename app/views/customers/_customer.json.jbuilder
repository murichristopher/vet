json.extract! customer, :id, :full_name, :registry_code, :identification_code, :zip_code, :phone_number, :created_at, :updated_at
json.url customer_url(customer, format: :json)
