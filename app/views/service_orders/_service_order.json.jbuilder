json.extract! service_order, :id, :customer_id, :pet_id, :description, :price, :inventory_items_id, :created_at, :updated_at
json.url service_order_url(service_order, format: :json)
