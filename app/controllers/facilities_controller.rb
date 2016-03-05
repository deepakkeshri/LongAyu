class FacilitiesController < ApplicationController
  
  #load_and_authorize_resource param_method: :facility_params
  def new
    if current_account.has_role? 'branch'
      @facility = current_account.centre.facilities.new
    else
      @facility = Facility.new
    end
  end
  
  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      redirect_to @facility
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
    @facilities = @centre.facilities
  end
  
  def show
    @facility = Facility.find(params[:id])
  end
  
  def edit
    @facility = Facility.find(params[:id])
  end
  
  def update
    @facility = Facility.find(params[:id])
    if @facility.update(facility_params)
      redirect_to @facility
    else
      render('edit')
    end
  end
  
  def delete
    
  end
  
  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
    redirect_to facilites_path
  end
  
  private
  def facility_params
    params.require(:facility).permit(:name,:description,:facility_type_id,:centre_id,:price,:dd_price,:start_time,:end_time)
  end
  
end
