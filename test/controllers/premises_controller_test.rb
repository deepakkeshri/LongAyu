require 'test_helper'

class PremisesControllerTest < ActionController::TestCase
  setup do
    @premise = premises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:premises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create premise" do
    assert_difference('Premise.count') do
      post :create, premise: { access_without_steps: @premise.access_without_steps, access_without_steps_description: @premise.access_without_steps_description, accessible_to_disabled: @premise.accessible_to_disabled, accessible_to_disabled_description: @premise.accessible_to_disabled_description, centre_id: @premise.centre_id, disabled_parking: @premise.disabled_parking, disabled_parking_description: @premise.disabled_parking_description, onsite_pharmacy: @premise.onsite_pharmacy, onsite_pharmacy_description: @premise.onsite_pharmacy_description, parking: @premise.parking, parking_description: @premise.parking_description, patient_bathroom: @premise.patient_bathroom, patient_bathroom_description: @premise.patient_bathroom_description, public_transport_access: @premise.public_transport_access, public_transport_access_description: @premise.public_transport_access_description, wireless_access: @premise.wireless_access, wireless_access_description: @premise.wireless_access_description }
    end

    assert_redirected_to premise_path(assigns(:premise))
  end

  test "should show premise" do
    get :show, id: @premise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @premise
    assert_response :success
  end

  test "should update premise" do
    patch :update, id: @premise, premise: { access_without_steps: @premise.access_without_steps, access_without_steps_description: @premise.access_without_steps_description, accessible_to_disabled: @premise.accessible_to_disabled, accessible_to_disabled_description: @premise.accessible_to_disabled_description, centre_id: @premise.centre_id, disabled_parking: @premise.disabled_parking, disabled_parking_description: @premise.disabled_parking_description, onsite_pharmacy: @premise.onsite_pharmacy, onsite_pharmacy_description: @premise.onsite_pharmacy_description, parking: @premise.parking, parking_description: @premise.parking_description, patient_bathroom: @premise.patient_bathroom, patient_bathroom_description: @premise.patient_bathroom_description, public_transport_access: @premise.public_transport_access, public_transport_access_description: @premise.public_transport_access_description, wireless_access: @premise.wireless_access, wireless_access_description: @premise.wireless_access_description }
    assert_redirected_to premise_path(assigns(:premise))
  end

  test "should destroy premise" do
    assert_difference('Premise.count', -1) do
      delete :destroy, id: @premise
    end

    assert_redirected_to premises_path
  end
end
