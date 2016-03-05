class ServiceTypesController < ApplicationController
  #load_and_authorize_resource param_method: :service_type_params
  def new
    @service_type = ServiceType.new
  end
  
  def create
    @service_type = ServiceType.new(service_type_params)
    if @service_type.save
      redirect_to @service_type
    else
      render('new')
    end
  end
  
  def index
    @service_types = ServiceType.all
  end
  
  def show
    @service_type = ServiceType.find(params[:id])
  end
  
  def edit
    @service_type = ServiceType.find(params[:id])
  end
  
  def update
    @service_type = ServiceType.find(params[:id])
    if @service_type.update(service_type_params)
      redirect_to @service_type
    else
      render('edit')
    end
  end
  
  def delete
    
  end
  
  def destroy
    @service_type = ServiceType.find(params[:id])
    @services = @service_type.services
    @services.each do |service|
      service.destroy
    end
    @service_type.destroy
    redirect_to service_types_path
  end
  
  def import
    if params[:file]
      ServiceType.import(params[:file])
      redirect_to service_types_path, notice: "Service Types imported."
    else
      render('new')
    end
  end
  
  private
  def service_type_params
    params.require(:service_type).permit(:name, :description)
  end
  
end
