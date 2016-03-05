json.array!(@medical_tests) do |medical_test|
  json.extract! medical_test, :id, :name, :short_name, :alt_name
  json.url medical_test_url(medical_test, format: :json)
end
