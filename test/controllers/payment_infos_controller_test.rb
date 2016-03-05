require 'test_helper'

class PaymentInfosControllerTest < ActionController::TestCase
  setup do
    @payment_info = payment_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:payment_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create payment_info" do
    assert_difference('PaymentInfo.count') do
      post :create, payment_info: { cash_accept: @payment_info.cash_accept, cash_accept_description: @payment_info.cash_accept_description, centre_id: @payment_info.centre_id, cheque_accept: @payment_info.cheque_accept, cheque_accept_description: @payment_info.cheque_accept_description, credit_accept: @payment_info.credit_accept, credit_accept_description: @payment_info.credit_accept_description, currency: @payment_info.currency, debit_accept: @payment_info.debit_accept, debit_accept_description: @payment_info.debit_accept_description, wallet_accept: @payment_info.wallet_accept, wallet_accept_description: @payment_info.wallet_accept_description }
    end

    assert_redirected_to payment_info_path(assigns(:payment_info))
  end

  test "should show payment_info" do
    get :show, id: @payment_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @payment_info
    assert_response :success
  end

  test "should update payment_info" do
    patch :update, id: @payment_info, payment_info: { cash_accept: @payment_info.cash_accept, cash_accept_description: @payment_info.cash_accept_description, centre_id: @payment_info.centre_id, cheque_accept: @payment_info.cheque_accept, cheque_accept_description: @payment_info.cheque_accept_description, credit_accept: @payment_info.credit_accept, credit_accept_description: @payment_info.credit_accept_description, currency: @payment_info.currency, debit_accept: @payment_info.debit_accept, debit_accept_description: @payment_info.debit_accept_description, wallet_accept: @payment_info.wallet_accept, wallet_accept_description: @payment_info.wallet_accept_description }
    assert_redirected_to payment_info_path(assigns(:payment_info))
  end

  test "should destroy payment_info" do
    assert_difference('PaymentInfo.count', -1) do
      delete :destroy, id: @payment_info
    end

    assert_redirected_to payment_infos_path
  end
end
