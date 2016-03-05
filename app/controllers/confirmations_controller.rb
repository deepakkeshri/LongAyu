class ConfirmationsController < Devise::ConfirmationsController

  private

  def after_confirmation_path_for(resource_name, resource)
    #your_new_after_confirmation_path
    if resource.has_role? :patient
      flash[:notice] = "Confirmed successfully, Please Complete Your Profile"

      edit_patient_path
    else
      root_path
    end
  end

end