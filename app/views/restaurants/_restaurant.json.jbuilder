json.extract! restaurant, :id, :name, :address, :opening_time, :closing_time, :opening_day, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
