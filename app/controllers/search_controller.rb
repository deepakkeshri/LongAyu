class SearchController < ApplicationController
  helper_method :sort_column, :sort_direction
  def index
    @centres=[]
    @location = []
    if params[:search_type] and params[:test_id]
      @search_type = params[:search_type]
      @search_values = @search_type.constantize.all
      @test_ids = params[:test_id].map(&:to_i)
      @tests = @search_type.constantize.where(id: @test_ids)
      pre_centre_ids = Array.new
      @tests.each_with_index do |test, index|
        if index == 0
          pre_centre_ids = test.centre_ids.split(',')
          pre_centre_ids = pre_centre_ids.map(&:to_i)
        else
          centre_ids = test.centre_ids.split(',')
          centre_ids = centre_ids.map(&:to_i)
          pre_centre_ids = centre_ids & pre_centre_ids
        end
      end

        if (params[:city_id] != 'City' or params[:pin_id] != 'PinCode') and not pre_centre_ids.empty?
          city = City.find(params[:city_id]) if params[:city_id] != 'City'
          pin = Postalcode.find(params[:pin_id]) if params[:pin_id] != 'PinCode'
          if city
            @location = Geocoder.coordinates(city.name)
          else
            @location = Geocoder.coordinates(pin.name)
          end
        else
          @location = request.location
        end
      @centres = Centre.near(@location,30).where(id: pre_centre_ids).paginate(:page => params[:page], :per_page => 1)
      #end
    elsif params[:search_type]
      @search_type = params[:search_type]
      @search_values = @search_type.constantize.all
    else
      flash[:error]='Please select a category'
      redirect_to(root_path) and return
    end
    #@centres = Kaminari.paginate_array(centres).page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index_app
    if params[:search]
      labs=Service.search(params[:search]).order(sort_column + " " + sort_direction)
      @query = params[:search]
    else
      labs=[]
    end
    @labs=Kaminari.paginate_array(labs).page(params[:page]).per(10)
    render :json => {:labs => labs}
  end

end

