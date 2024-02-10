json.extract! service_queue_item, :id, :customer_id, :pet_id, :queue_name, :status, :urgency, :created_at, :updated_at
json.url service_queue_item_url(service_queue_item, format: :json)
