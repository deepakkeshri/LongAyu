class PaymentInfosController < ApplicationController
  before_action :set_payment_info, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @payment_infos = PaymentInfo.all
    respond_with(@payment_infos)
  end

  def show
    respond_with(@payment_info)
  end

  def new
    @payment_info = PaymentInfo.new
    respond_with(@payment_info)
  end

  def edit
  end

  def create
    @payment_info = PaymentInfo.new(payment_info_params)
    @payment_info.save
    respond_with(@payment_info)
  end

  def update
    @payment_info.update(payment_info_params)
    respond_with(@payment_info)
  end

  def destroy
    @payment_info.destroy
    respond_with(@payment_info)
  end

  private
    def set_payment_info
      @payment_info = PaymentInfo.find(params[:id])
    end

    def payment_info_params
      params.require(:payment_info).permit(:currency, :cheque_accept, :cheque_accept_description, :debit_accept, :debit_accept_description, :credit_accept, :credit_accept_description, :wallet_accept, :wallet_accept_description, :cash_accept, :cash_accept_description, :centre_id)
    end
end
