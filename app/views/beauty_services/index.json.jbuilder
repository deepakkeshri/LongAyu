json.array!(@beauty_services) do |beauty_service|
  json.extract! beauty_service, :id, :name, :short_name, :alt_name, :description
  json.url beauty_service_url(beauty_service, format: :json)
end
