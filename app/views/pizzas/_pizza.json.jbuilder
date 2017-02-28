json.extract! pizza, :id, :name, :price, :ingredients, :restaurant_id, :created_at, :updated_at
json.url pizza_url(pizza, format: :json)
