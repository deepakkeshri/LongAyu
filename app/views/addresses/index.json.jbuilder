json.array!(@addresses) do |address|
  json.extract! address, :id, :address1, :address2, :address3, :landmark1, :landmark2, :landmark3, :city, :state, :country, :pin, :addressable_id, :addessable_type
  json.url address_url(address, format: :json)
end
