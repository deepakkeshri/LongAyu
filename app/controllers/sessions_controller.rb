class SessionsController < Devise::SessionsController
   
  prepend_before_filter :require_no_authentication, only: [:new,:create,:create_centre,:cancel]
  prepend_before_filter :allow_params_authentication!, only: [:create,:create_centre]
  prepend_before_filter :verify_signed_out_user, only: [:destroy]
  prepend_before_filter only: [:create,:create_centre,:destroy] {request.env["devise.skip_timeout"] = true }
  
  def new_centre
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords resource
    yield resource if block_given?
    respond_with (resource)
  end
  
  def login=(login)
    @login = login
  end
  
  def login
    @login || self.mobile || self.email
  end
  
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name,resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end
  
  def create_centre
    self.resource = warden.authenticate!(centre_auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name,resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end
  
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
    yield if block_given?
    respond_to_on_destroy
  end
  
  protected
  
  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
    #params.require(:account).permit(:login,:mobile,:email,:password)
  end
  
  def auth_options
    {scope: resource_name, recall: "#{controller_path}#new" }
  end
  
  def centre_auth_options
    {scope: resource_name, recall: "#{controller_path}#new_centre"}
  end
  
end 