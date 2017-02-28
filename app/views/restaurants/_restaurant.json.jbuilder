json.extract! restaurant, :id, :name, :address, :openings_time, :closings_time, :opening_day, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
