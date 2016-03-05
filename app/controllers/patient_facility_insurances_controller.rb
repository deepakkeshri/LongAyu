class PatientFacilityInsurancesController < ApplicationController
  before_action :set_patient_facility_insurance, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @patient_facility_insurances = PatientFacilityInsurance.all
    respond_with(@patient_facility_insurances)
  end

  def show
    respond_with(@patient_facility_insurance)
  end

  def new
    @patient_facility_insurance = PatientFacilityInsurance.new
    respond_with(@patient_facility_insurance)
  end

  def edit
  end

  def create
    @patient_facility_insurance = PatientFacilityInsurance.new(patient_facility_insurance_params)
    @patient_facility_insurance.save
    respond_with(@patient_facility_insurance)
  end

  def update
    @patient_facility_insurance.update(patient_facility_insurance_params)
    respond_with(@patient_facility_insurance)
  end

  def destroy
    @patient_facility_insurance.destroy
    respond_with(@patient_facility_insurance)
  end

  private
    def set_patient_facility_insurance
      @patient_facility_insurance = PatientFacilityInsurance.find(params[:id])
    end

    def patient_facility_insurance_params
      params.require(:patient_facility_insurance).permit(:centre_id, :without_insurance_accepted, :without_insurance_accepted_description, :public_insurance_accepted, :public_insurance_accepted_description, :private_insurance_accepted, :private_insurance_accepted_description, :with_dental_pain_accepted, :with_dental_pain_accepted_description)
    end
end
