require 'test_helper'

class PatientFacilityInsurancesControllerTest < ActionController::TestCase
  setup do
    @patient_facility_insurance = patient_facility_insurances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:patient_facility_insurances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create patient_facility_insurance" do
    assert_difference('PatientFacilityInsurance.count') do
      post :create, patient_facility_insurance: { centre_id: @patient_facility_insurance.centre_id, private_insurance_accepted: @patient_facility_insurance.private_insurance_accepted, private_insurance_accepted_description: @patient_facility_insurance.private_insurance_accepted_description, public_insurance_accepted: @patient_facility_insurance.public_insurance_accepted, public_insurance_accepted_description: @patient_facility_insurance.public_insurance_accepted_description, with_dental_pain_accepted: @patient_facility_insurance.with_dental_pain_accepted, with_dental_pain_accepted_description: @patient_facility_insurance.with_dental_pain_accepted_description, without_insurance_accepted: @patient_facility_insurance.without_insurance_accepted, without_insurance_accepted_description: @patient_facility_insurance.without_insurance_accepted_description }
    end

    assert_redirected_to patient_facility_insurance_path(assigns(:patient_facility_insurance))
  end

  test "should show patient_facility_insurance" do
    get :show, id: @patient_facility_insurance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @patient_facility_insurance
    assert_response :success
  end

  test "should update patient_facility_insurance" do
    patch :update, id: @patient_facility_insurance, patient_facility_insurance: { centre_id: @patient_facility_insurance.centre_id, private_insurance_accepted: @patient_facility_insurance.private_insurance_accepted, private_insurance_accepted_description: @patient_facility_insurance.private_insurance_accepted_description, public_insurance_accepted: @patient_facility_insurance.public_insurance_accepted, public_insurance_accepted_description: @patient_facility_insurance.public_insurance_accepted_description, with_dental_pain_accepted: @patient_facility_insurance.with_dental_pain_accepted, with_dental_pain_accepted_description: @patient_facility_insurance.with_dental_pain_accepted_description, without_insurance_accepted: @patient_facility_insurance.without_insurance_accepted, without_insurance_accepted_description: @patient_facility_insurance.without_insurance_accepted_description }
    assert_redirected_to patient_facility_insurance_path(assigns(:patient_facility_insurance))
  end

  test "should destroy patient_facility_insurance" do
    assert_difference('PatientFacilityInsurance.count', -1) do
      delete :destroy, id: @patient_facility_insurance
    end

    assert_redirected_to patient_facility_insurances_path
  end
end
