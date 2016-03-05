class ClinicFacilityTravellersController < ApplicationController
  before_action :set_clinic_facility_traveller, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @clinic_facility_travellers = ClinicFacilityTraveller.all
    respond_with(@clinic_facility_travellers)
  end

  def show
    respond_with(@clinic_facility_traveller)
  end

  def new
    @clinic_facility_traveller = ClinicFacilityTraveller.new
    respond_with(@clinic_facility_traveller)
  end

  def edit
  end

  def create
    @clinic_facility_traveller = ClinicFacilityTraveller.new(clinic_facility_traveller_params)
    @clinic_facility_traveller.save
    respond_with(@clinic_facility_traveller)
  end

  def update
    @clinic_facility_traveller.update(clinic_facility_traveller_params)
    respond_with(@clinic_facility_traveller)
  end

  def destroy
    @clinic_facility_traveller.destroy
    respond_with(@clinic_facility_traveller)
  end

  private
    def set_clinic_facility_traveller
      @clinic_facility_traveller = ClinicFacilityTraveller.find(params[:id])
    end

    def clinic_facility_traveller_params
      params.require(:clinic_facility_traveller).permit(:centre_id, :international_trael_friendly, :international_travel_friendly_description, :local_travel_friendly, :local_travel_friendly_description, :traveller_accomodation_friendly, :traveller_accomodation_friendly_description, :local_guide, :local_guide_description, :tour_and_vacation_services, :tour_and_vacation_services_description, :pickup_from_hotel, :pickup_from_hotel_decription, :pickup_from_airport, :pickup_from_airport_description)
    end
end
