json.array!(@medicines) do |medicine|
  json.extract! medicine, :id, :name, :short_name, :alt_name, :description
  json.url medicine_url(medicine, format: :json)
end
