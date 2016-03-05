json.array!(@patient_facility_insurances) do |patient_facility_insurance|
  json.extract! patient_facility_insurance, :id, :centre_id, :without_insurance_accepted, :without_insurance_accepted_description, :public_insurance_accepted, :public_insurance_accepted_description, :private_insurance_accepted, :private_insurance_accepted_description, :with_dental_pain_accepted, :with_dental_pain_accepted_description
  json.url patient_facility_insurance_url(patient_facility_insurance, format: :json)
end
