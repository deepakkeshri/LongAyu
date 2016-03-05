class PropertiesController < ApplicationController
  load_and_authorize_resource param_method: :property_params
  
  def new
    @property = Property.new
  end
  
  def signin
    
  end
  
  def signout
    
  end
  
  def create
    @property = resource.Property.new(property_params)
    if @property.save
      redirect_to @property
    else
      render('new')
    end
  end
  
  def index
    @properties = Property.all
  end
  
  def show
    @property = Property.find(params[:id])
  end
  
  def edit
    @property = Property.find(params[:id])
  end
  
  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to @property
    else
      render('edit')
    end
  end
  
  def delete
    
  end
  
  def destroy
    @property = Property.find(params[:id])
    @account = @property.account.destroy
    @property.destroy
    redirect_to property_path
  end
  
  def services
    @centres = current_account.property.centres
  end
  
  def new_service
    @service = Service.new
  end
  
  def create_service
    @service = Service.new(service_params)
    if @service.save
      redirect_to @service
    else
      render('new_service')
    end
  end
  
  def facilities
    @centres = current_account.property.centres
  end
  
  def new_facility
    @facility = Facility.new
  end
  
  def create_facility
    @facility = Facility.new(facility_params)
    if @facility.save
      redirect_to @facility
    else
      render('new_facility')
    end
  end
  
  private
  def property_params
    params.require(:property).permit(:name,:secondary_email,:address_line1,:address_line2,:landmark,:country_mobile_code,:mobile,:pincode,:city,:state,:country)
  end
  
  def service_params
    params.require(:service).permit(:name,:description,:service_type_id,:centre_id,:price,:availability_hour)
  end
  
  def facility_params
    params.require(:facility).permit(:name,:description,:facility_type_id,:centre_id)
  end
  
end
