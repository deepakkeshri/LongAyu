class BeautyServicesController < ApplicationController
  load_and_authorize_resource param_method: :beauty_service_params
  before_action :set_beauty_service, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @beauty_services = BeautyService.all
    respond_with(@beauty_services)
  end

  def show
    respond_with(@beauty_service)
  end

  def new
    @beauty_service = BeautyService.new
    respond_with(@beauty_service)
  end

  def edit
  end

  def create
    @beauty_service = BeautyService.new(beauty_service_params)
    @beauty_service.save
    respond_with(@beauty_service)
  end

  def update
    @beauty_service.update(beauty_service_params)
    respond_with(@beauty_service)
  end

  def destroy
    @beauty_service.destroy
    respond_with(@beauty_service)
  end

  private
    def set_beauty_service
      @beauty_service = BeautyService.find(params[:id])
    end

    def beauty_service_params
      params.require(:beauty_service).permit(:name, :short_name, :alt_name, :description)
    end
end
