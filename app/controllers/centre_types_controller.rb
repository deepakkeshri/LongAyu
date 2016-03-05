class CentreTypesController < ApplicationController
  load_and_authorize_resource param_method: :centre_type_params
  
  def new
    @centre_type = CentreType.new
  end
  
  def create
    @centre_type = CentreType.new(centre_type_params)
    if @centre_type.save
      redirect_to @centre_type
    else
      render('new')
    end
  end
  
  def index
    @centre_types = CentreType.all
  end
  
  def show
    @centre_type = CentreType.find(params[:id])
  end
  
  def edit
    @centre_type = CentreType.find(params[:id])
  end
  
  def update
    @centre_type = CentreType.find(params[:id])
    if @centre_type.update(centre_type_params)
      redirect_to @centre_type
    else
      render('edit')
    end
  end
  
  def delete
    
  end
  
  def destroy
    @centre_type = CentreType.find(params[:id])
    @centres = @centre_type.centres
    @centres.each do |centre|
      centre.account.destroy
      centre.destroy
    end
    @centre_type.destroy
    redirect_to centre_types_path
  end
  
  def import
    if params[:file]
      CentreType.import(params[:file])
      redirect_to centre_types_path, notice: "Centre Types imported."
    else
      render('new')
    end
  end
  
  private
  def centre_type_params
    params.require(:centre_type).permit(:name,:description)
  end
  
end
