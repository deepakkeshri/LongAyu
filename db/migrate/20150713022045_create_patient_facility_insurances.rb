class CreatePatientFacilityInsurances < ActiveRecord::Migration
  def change
    create_table :patient_facility_insurances do |t|
      t.integer :centre_id
      t.boolean :without_insurance_accepted
      t.text :without_insurance_accepted_description
      t.boolean :public_insurance_accepted
      t.text :public_insurance_accepted_description
      t.boolean :private_insurance_accepted
      t.text :private_insurance_accepted_description
      t.boolean :with_dental_pain_accepted
      t.text :with_dental_pain_accepted_description

      t.timestamps
    end
  end
end
