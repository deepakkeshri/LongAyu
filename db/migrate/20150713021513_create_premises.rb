class CreatePremises < ActiveRecord::Migration
  def change
    create_table :premises do |t|
      t.boolean :parking
      t.text :parking_description
      t.boolean :accessible_to_disabled
      t.text :accessible_to_disabled_description
      t.boolean :public_transport_access
      t.text :public_transport_access_description
      t.boolean :access_without_steps
      t.text :access_without_steps_description
      t.boolean :disabled_parking
      t.text :disabled_parking_description
      t.boolean :patient_bathroom
      t.text :patient_bathroom_description
      t.boolean :wireless_access
      t.text :wireless_access_description
      t.boolean :onsite_pharmacy
      t.text :onsite_pharmacy_description
      t.integer :centre_id

      t.timestamps
    end
  end
end
