json.extract! hospitalization_item, :id, :pet_id, :status, :name, :created_at, :updated_at
json.url hospitalization_item_url(hospitalization_item, format: :json)
