class PatientsController < ApplicationController
  #load_and_authorize_resource param_method: :patient_params
  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient
    else
      render('new')
    end
  end

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end
def signin

end
  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render('edit')
    end
  end

  def delete

  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to root_url
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name,:acoount_id, :email, :title, :qualification, :country_mobile_code_id, :mobile_contact_no, :home_contact_no, :landline_no, :fax_no, :work_contact_no, :address_line1, :address_line2, :address_line3, :city_id, :state_id, :country_id, :postal_code_id, :photo, :hide_name_in_review, :hide_photo_in_review, :email_subscription, :sms_subscription, :blood_group, :dob, :height, :weight, :gender, :language, :allergies)
  end

end
