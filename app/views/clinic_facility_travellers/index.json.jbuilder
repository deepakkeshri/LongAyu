json.array!(@clinic_facility_travellers) do |clinic_facility_traveller|
  json.extract! clinic_facility_traveller, :id, :centre_id, :international_trael_friendly, :international_travel_friendly_description, :local_travel_friendly, :local_travel_friendly_description, :traveller_accomodation_friendly, :traveller_accomodation_friendly_description, :local_guide, :local_guide_description, :tour_and_vacation_services, :tour_and_vacation_services_description, :pickup_from_hotel, :pickup_from_hotel_decription, :pickup_from_airport, :pickup_from_airport_description
  json.url clinic_facility_traveller_url(clinic_facility_traveller, format: :json)
end
