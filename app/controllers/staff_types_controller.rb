class StaffTypesController < ApplicationController
  
  #load_and_authorize_resource param_method: :staff_type_params
  
  def new
    @staff_type = StaffType.new
  end
  
  def create
    @staff_type = StaffType.new(staff_type_params)
    if @staff_type.save
      redirect_to @staff_type
    else
      render('new')
    end
  end
  
  def index
    @staff_types = StaffType.all
  end
  
  def show
    @staff_type = StaffType.find(params[:id])
  end
  
  def edit
    @staff_type = StaffType.find(params[:id])
  end
  
  def update
    @staff_type = StaffType.find(params[:id])
    if @staff_type.update(staff_type_params)
      redirect_to @staff_type
    else
      render('edit')
    end
  end
  
  def delete
    
  end
  
  def destroy
    @staff_type = StaffType.find(params[:id])
    @staff_type.destroy
    redirect_to staff_types_path
  end
  
  def import
    if params[:file]
      StaffType.import(params[:file])
      redirect_to staff_types_path, notice: "Centre Types imported."
    else
      render('new')
    end
  end
  
  private
  def staff_type_params
    params.require(:staff_type).permit(:name,:description)
  end
  
end
