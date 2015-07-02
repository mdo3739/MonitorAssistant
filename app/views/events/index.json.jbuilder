json.array!(@events) do |event|
  json.extract! event, :id, :application_id, :name
  json.url event_url(event, format: :json)
end
