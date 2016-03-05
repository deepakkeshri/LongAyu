class PremisesController < ApplicationController
  before_action :set_premise, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @premises = Premise.all
    respond_with(@premises)
  end

  def show
    respond_with(@premise)
  end

  def new
    @premise = Premise.new
    respond_with(@premise)
  end

  def edit
  end

  def create
    @premise = Premise.new(premise_params)
    @premise.save
    respond_with(@premise)
  end

  def update
    @premise.update(premise_params)
    respond_with(@premise)
  end

  def destroy
    @premise.destroy
    respond_with(@premise)
  end

  private
    def set_premise
      @premise = Premise.find(params[:id])
    end

    def premise_params
      params.require(:premise).permit(:parking, :parking_description, :accessible_to_disabled, :accessible_to_disabled_description, :public_transport_access, :public_transport_access_description, :access_without_steps, :access_without_steps_description, :disabled_parking, :disabled_parking_description, :patient_bathroom, :patient_bathroom_description, :wireless_access, :wireless_access_description, :onsite_pharmacy, :onsite_pharmacy_description, :centre_id)
    end
end
