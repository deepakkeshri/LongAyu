class Api::V1::RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token   
  def create
    a = Account.new(sign_up_params)
    a.skip_confirmed!
    a.save
    p = Patient.new(patient_params)
    p.account_id = a.id if a
    if !p.save 
      render :json => { :result => "Error." }  
    else
      a.add_role :patient
      render :json => { :result => "Successfully signed up." } 
    end 
  end
  
  def create_branch
    c = Centre.new(centre_sign_up_params)
    c.skip_confirmed!
    if !c.save
      render :json => { :result => "Error." }  
    else
      a.add_role :branch
      render :json => { :result => "Successfully signed up." } 
    end
  end
  
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  protected
  
  def property_sign_up_params
    params.require(:account).permit(:login,:mobile,:email,:password,:terms_of_service,:password_confirmation,property_attributes: [:id,:name,:website,:language,:timezone,:secondary_email,:secondary_mobile,:address_line1,:address_line2,:landmark,:city,:state,:country])
  end
  
  def centre_sign_up_params
    params.require(:account).permit(:login,:mobile,:email,:password,:password_confirmation,:terms_of_service,centre_attributes: [:id, :name,:centre_type_id,:centre_id,:unique_id])
  end

  def patient_params
    params.require(:account).permit(:first_name, :last_name, :title)
  end
  
  def sign_up_params
    params.require(:account).permit(:login,:mobile,:email,:password,:password_confirmation,:terms_of_service, patient_attributes: [:id, :first_name, :last_name, :title])
  end

  def account_update_params
    params.require(:account).permit(:login,:mobile,:email,:password,:password_confirmation,:current_password,:terms_of_service)
  end
end 
