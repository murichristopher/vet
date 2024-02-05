json.extract! inventory_item, :id, :price, :name, :quantity, :created_at, :updated_at
json.url inventory_item_url(inventory_item, format: :json)
