class CreateClinicFacilityTravellers < ActiveRecord::Migration
  def change
    create_table :clinic_facility_travellers do |t|
      t.integer :centre_id
      t.boolean :international_trael_friendly
      t.text :international_travel_friendly_description
      t.boolean :local_travel_friendly
      t.text :local_travel_friendly_description
      t.boolean :traveller_accomodation_friendly
      t.text :traveller_accomodation_friendly_description
      t.boolean :local_guide
      t.text :local_guide_description
      t.boolean :tour_and_vacation_services
      t.text :tour_and_vacation_services_description
      t.boolean :pickup_from_hotel
      t.text :pickup_from_hotel_decription
      t.boolean :pickup_from_airport
      t.text :pickup_from_airport_description

      t.timestamps
    end
  end
end
