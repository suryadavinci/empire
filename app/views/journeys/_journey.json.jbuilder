json.extract! journey, :id, :bus_id, :journey_date, :departure_time, :arrival_time, :from_id, :to_id, :created_at, :updated_at
json.url journey_url(journey, format: :json)
