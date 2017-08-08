json.extract! bus, :id, :name, :max_seats, :created_at, :updated_at
json.url bus_url(bus, format: :json)
