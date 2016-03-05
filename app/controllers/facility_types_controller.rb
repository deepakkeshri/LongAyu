class FacilityTypesController < ApplicationController
  
  load_and_authorize_resource param_method: :facility_type_params
  
  def new
    @facility_type = FacilityType.new
  end
  
  def create
    @facility_type = FacilityType.new(facility_type_params)
    if @facility_type.save
      redirect_to @facility_type
    else
      render('new')
    end
  end
  
  def index
    @facility_types = FacilityType.all
  end
  
  def show
    @facility_type = FacilityType.find(params[:id])
  end
  
  def edit
    @facility_type = FacilityType.find(params[:id])
  end
  
  def update
    @facility_type = FacilityType.find(params[:id])
    if @facility_type.update(facility_type_params)
      redirect_to @facility_type
    else
      render('edit')
    end
  end
  
  def delete
    
  end
  
  def destroy
    @facility_type = FacilityType.find(params[:id])
    @facility_type.destroy
    redirect_to facility_types_path
  end
  
  def import
    if params[:file]
      FacilityType.import(params[:file])
      redirect_to facility_types_path, notice: "Centre Types imported."
    else
      render('new')
    end
  end
  
  private
  def facility_type_params
    params.require(:facility_type).permit(:name,:description)
  end
  
end
