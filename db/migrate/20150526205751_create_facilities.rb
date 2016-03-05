class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.references :facility_type, index: true
      t.references :centre, index: true
      t.string :name
      t.text :description
      t.float :price
      t.float :dd_price
      t.datetime :start_time
      t.datetime :end_time
      t.bool :emergency_service_facility
      t.text :emergency_service_facility_description
      t.bool :food_facility
      t.text :food_facility_description
      t.bool :customercare24x7_facility
      t.text :customercare24x7_facility_description
      t.bool :free_first_consultation
      t.text :free_first_consultation_description
      t.bool :appointment_helpline
      t.text :appointment_helpline_description
      t.bool :ambulance
      t.text :ambulance_description
      t.bool :pickup_and_drop
      t.text :pickup_and_drop_description
      t.bool :open_on_weekend
      t.text :open_on_weekend_description
      t.bool :open_24x7
      t.text :open_24x7_description
      t.timestamps
    end
  end
end
