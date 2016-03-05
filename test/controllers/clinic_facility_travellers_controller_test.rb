require 'test_helper'

class ClinicFacilityTravellersControllerTest < ActionController::TestCase
  setup do
    @clinic_facility_traveller = clinic_facility_travellers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clinic_facility_travellers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clinic_facility_traveller" do
    assert_difference('ClinicFacilityTraveller.count') do
      post :create, clinic_facility_traveller: { centre_id: @clinic_facility_traveller.centre_id, international_trael_friendly: @clinic_facility_traveller.international_trael_friendly, international_travel_friendly_description: @clinic_facility_traveller.international_travel_friendly_description, local_guide: @clinic_facility_traveller.local_guide, local_guide_description: @clinic_facility_traveller.local_guide_description, local_travel_friendly: @clinic_facility_traveller.local_travel_friendly, local_travel_friendly_description: @clinic_facility_traveller.local_travel_friendly_description, pickup_from_airport: @clinic_facility_traveller.pickup_from_airport, pickup_from_airport_description: @clinic_facility_traveller.pickup_from_airport_description, pickup_from_hotel: @clinic_facility_traveller.pickup_from_hotel, pickup_from_hotel_decription: @clinic_facility_traveller.pickup_from_hotel_decription, tour_and_vacation_services: @clinic_facility_traveller.tour_and_vacation_services, tour_and_vacation_services_description: @clinic_facility_traveller.tour_and_vacation_services_description, traveller_accomodation_friendly: @clinic_facility_traveller.traveller_accomodation_friendly, traveller_accomodation_friendly_description: @clinic_facility_traveller.traveller_accomodation_friendly_description }
    end

    assert_redirected_to clinic_facility_traveller_path(assigns(:clinic_facility_traveller))
  end

  test "should show clinic_facility_traveller" do
    get :show, id: @clinic_facility_traveller
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clinic_facility_traveller
    assert_response :success
  end

  test "should update clinic_facility_traveller" do
    patch :update, id: @clinic_facility_traveller, clinic_facility_traveller: { centre_id: @clinic_facility_traveller.centre_id, international_trael_friendly: @clinic_facility_traveller.international_trael_friendly, international_travel_friendly_description: @clinic_facility_traveller.international_travel_friendly_description, local_guide: @clinic_facility_traveller.local_guide, local_guide_description: @clinic_facility_traveller.local_guide_description, local_travel_friendly: @clinic_facility_traveller.local_travel_friendly, local_travel_friendly_description: @clinic_facility_traveller.local_travel_friendly_description, pickup_from_airport: @clinic_facility_traveller.pickup_from_airport, pickup_from_airport_description: @clinic_facility_traveller.pickup_from_airport_description, pickup_from_hotel: @clinic_facility_traveller.pickup_from_hotel, pickup_from_hotel_decription: @clinic_facility_traveller.pickup_from_hotel_decription, tour_and_vacation_services: @clinic_facility_traveller.tour_and_vacation_services, tour_and_vacation_services_description: @clinic_facility_traveller.tour_and_vacation_services_description, traveller_accomodation_friendly: @clinic_facility_traveller.traveller_accomodation_friendly, traveller_accomodation_friendly_description: @clinic_facility_traveller.traveller_accomodation_friendly_description }
    assert_redirected_to clinic_facility_traveller_path(assigns(:clinic_facility_traveller))
  end

  test "should destroy clinic_facility_traveller" do
    assert_difference('ClinicFacilityTraveller.count', -1) do
      delete :destroy, id: @clinic_facility_traveller
    end

    assert_redirected_to clinic_facility_travellers_path
  end
end
