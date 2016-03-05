require 'test_helper'

class AddressesControllerTest < ActionController::TestCase
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:addresses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create address" do
    assert_difference('Address.count') do
      post :create, address: { addessable_type: @address.addessable_type, address1: @address.address1, address2: @address.address2, address3: @address.address3, addressable_id: @address.addressable_id, city: @address.city, country: @address.country, landmark1: @address.landmark1, landmark2: @address.landmark2, landmark3: @address.landmark3, pin: @address.pin, state: @address.state }
    end

    assert_redirected_to address_path(assigns(:address))
  end

  test "should show address" do
    get :show, id: @address
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @address
    assert_response :success
  end

  test "should update address" do
    patch :update, id: @address, address: { addessable_type: @address.addessable_type, address1: @address.address1, address2: @address.address2, address3: @address.address3, addressable_id: @address.addressable_id, city: @address.city, country: @address.country, landmark1: @address.landmark1, landmark2: @address.landmark2, landmark3: @address.landmark3, pin: @address.pin, state: @address.state }
    assert_redirected_to address_path(assigns(:address))
  end

  test "should destroy address" do
    assert_difference('Address.count', -1) do
      delete :destroy, id: @address
    end

    assert_redirected_to addresses_path
  end
end
