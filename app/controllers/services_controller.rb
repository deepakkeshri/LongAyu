class ServicesController < ApplicationController
  #load_and_authorize_resource param_method: :service_params
  def new
    if current_account.has_role? 'branch'
      @service = current_account.centre.services.new
    else
      @service = Service.new
    end
  end
  
  def create
    #@centre = current_account.centre
    @service = Service.new(service_params)
    if @service.save
      redirect_to @service
    else
      render('new')
    end
  end
  
  def index
    if current_account.has_role? 'branch_admin'
      @centres = current_account.centre.centres
    elsif current_account.has_role? 'branch'
      @centres = [current_account.centre]
    end
  end
  
  def index2
    @centre = Centre.find(params[:id])
    @services = @centre.services
  end
  
  def show
    @service = Service.find(params[:id])
  end
  
  def edit
    @service = Service.find(params[:id])
  end
  
  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to @service
    else
      render('edit')
    end
  end
  
  def delete
    
  end
  
  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path
  end

  def data_import

  end

  def import
    if params[:file]
      if params[:centre]
        centre_id = params[:centre][:id]
      else
        centre_id = current_account.centre.id
      end
      filename = File.basename(params[:file].original_filename, ".*" )
      service_type = ServiceType.find_by_name(filename.humanize)
      if not service_type
        service_type = ServiceType.new(:name => filename.humanize)
        service_type.save
      end
      Service.import(params[:file], centre_id, service_type.id)
      flash[:notice]= "Services imported."
      redirect_to :back
    else
      render('new')
    end
  end

  def book

  end

  private
  def service_params
    params.require(:service).permit(:name,:description,:service_type_id,:centre_id,:price,:availability_hour)
  end


end
