json.extract! event, :id, :name, :place, :description, :date, :mob_id, :created_at, :updated_at
json.url event_url(event, format: :json)
