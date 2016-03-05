class CentresController < ApplicationController
  load_and_authorize_resource param_method: :centre_params
  
  def new
    @account = Account.new
    @account.build_centre
    #@centre = Centre.new
  end
  
  def create
    if @account.save
      redirect_to centres_path
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
  
  def show
    @centre = Centre.find(params[:id])
  end
  
  def edit
    @centre = Centre.find(params[:id])
  end
  
  def update
    @centre = Centre.find(params[:id])
    if @centre.update(centre_params)
      redirect_to @centre
    else
      render('edit')
    end
  end
  
  def delete
    
  end
  
  def destroy
    @centre = Centre.find(params[:id])
    @centre.account.destroy
    @centre.destroy
    redirect_to centres_path
  end

  def data_import

  end

  def import
    if params[:file]
      if params[:centre]
        centre_id = params[:centre][:id]
      else
        centre_id = nil
      end
      filename = File.basename(params[:file].original_filename, ".*" )
      if(params[:centre_type])
        centre_type_id = params[:centre_type][:id]
      else
        centre_type = CentreType.find_by_name(:name => filename.humanize)
        if not centre_type
          centre_type = CentreType.new(:name => filename.humanize)
          centre_type.save
          centre_type_id = centre_type.id
        end
      end
      Centre.import(params[:file], centre_id, centre_type_id)
      flash[:notice]= "Centres imported."
      redirect_to :back
    else
      render('new')
    end
  end

  private
  def centre_params
    params.require(:centre).permit(:name,:centre_type_id,:centre_id,:name,:secondary_email,:close_day,:open_time,:close_time,:lunch_start_time,:lunch_end_time,:address_line1,:address_line2,:landmark,:country_mobile_code,:mobile,:pincode,:city,:state,:country )
  end
  
end
