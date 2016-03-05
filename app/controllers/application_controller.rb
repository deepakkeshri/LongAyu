class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  alias_method :current_user, :current_account
  
  def after_sign_in_path_for(resource)
    "/welcome"
  end
  
  def after_sign_up_path_for(resource)
    "/welcome"
  end
  
  def after_sign_out_path_for(resource)
     "/welcome"
  end
  
end
