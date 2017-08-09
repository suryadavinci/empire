json.extract! booking, :id, :journey_id, :user_id, :seats_count, :created_at, :updated_at
json.url booking_url(booking, format: :json)
