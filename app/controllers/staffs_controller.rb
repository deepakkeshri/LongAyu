class StaffsController < ApplicationController
  #load_and_authorize_resource param_method: :staff_params
  
  def new
    if current_account.has_role? 'property'
      @property = current_account.property
    elsif current_account.has_role? 'centre'
      @property = current_account.centre.property
    end
    @staff = @property.staffs.new
  end
  
  def create
    if current_account.has_role? 'property'
      @property = current_account.property
    elsif current_account.has_role? 'centre'
      @property = current_account.centre.property
    end
    @staff = @property.staffs.new(staff_params)
    if @staff.save
      redirect_to @staff
    else
      render('new')
    end
  end
  
  def index2
    @property = current_account.property
    @staffs = @property.staffs
  end
  
  def index
    if current_account.has_role? 'branch_admin'
      @property = current_account.property
      @staffs = @property.staffs.order(:centre)
    elsif current_account.has_role? 'branch'
      @property = current_account.centre.property
      @staffs = @property.staffs.where(centre: current_account.centre.name).order(:centre)
    end
  end
  
  def show
    @property = current_account.property
    @staff = Staff.find(params[:id])
  end
  
  def edit
    @property = current_account.property
    @staff = Staff.find(params[:id])
  end
  
  def update
    @property = current_account.property
    @staff = Staff.find(params[:id])
    if @staff.update(staff_params)
      redirect_to @staff
    else
      render('edit')
    end
  end
  
  def delete
    
  end
  
  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    redirect_to staffs_path
  end
  
  private
  def staff_params
    params.require(:staff).permit(:property_id,:staff_type_id,:centre,:staff_id,:title,:first_name,:last_name,:gender,:email,:country_mobile_code,:mobile,:designation,:biography,:qualification,:degree,:specialization,:language,:address_line1,:pincode,:city,:state,:country)
  end
  
end
