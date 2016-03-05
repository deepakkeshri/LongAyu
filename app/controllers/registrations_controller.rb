class RegistrationsController < Devise::RegistrationsController
   
  prepend_before_filter :require_no_authentication, only: [:new,:create,:cancel]
  #prepend_before_filter :authentication_scope, only: [:edit,:update,:destroy]
  
  def new
    build_resource({})
    resource.build_patient
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end
  
  def new_centre
    build_resource({})
    resource.build_centre
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end
  
  def new_branch
    build_resource({})
    resource.build_centre
    set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end
  
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      resource.add_role :patient
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name,resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        #expire_date_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
  
  def create_centre
    build_resource(centre_sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      resource.add_role :branch_admin
      resource.centre.centre_id = resource.centre.id
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name,resource)
        redirect_to edit_centre_path(resource.centre)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        #expire_date_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      render('new_centre')
    end
  end
  
  def create_branch
    build_resource(centre_sign_up_params)
    resource.save
    if resource.persisted?
      resource.add_role :branch
      set_flash_message :notice, :branch_added if is_flashing_format?
      redirect_to edit_centre_path(resource.centre)
    else
      clean_up_passwords resource
      set_minimum_password_length
      render('new_branch')
    end
  end
  
  def edit
    render :edit
  end
  
  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
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

  # DELETE /resource
  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed if is_flashing_format?
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    expire_data_after_sign_in!
    redirect_to new_registration_path(resource_name)
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