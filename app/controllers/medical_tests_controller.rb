class MedicalTestsController < ApplicationController
  load_and_authorize_resource param_method: :medical_test_params
  before_action :set_medical_test, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @medical_tests = MedicalTest.all
    respond_with(@medical_tests)
  end

  def show
    respond_with(@medical_test)
  end

  def new
    @medical_test = MedicalTest.new
    respond_with(@medical_test)
  end

  def edit
  end

  def create
    @medical_test = MedicalTest.new(medical_test_params)
    @medical_test.save
    respond_with(@medical_test)
  end

  def update
    @medical_test.update(medical_test_params)
    respond_with(@medical_test)
  end

  def destroy
    @medical_test.destroy
    respond_with(@medical_test)
  end

  private
    def set_medical_test
      @medical_test = MedicalTest.find(params[:id])
    end

    def medical_test_params
      params.require(:medical_test).permit(:name, :short_name, :alt_name)
    end
end
