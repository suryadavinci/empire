json.extract! transport, :id, :bus_id, :from_id, :to_id, :start_date, :end_date, :departure_time, :arrival_time, :recurrence, :created_at, :updated_at
json.url transport_url(transport, format: :json)
