class WelcomeController < ApplicationController
  
  def index
    @med_test = MedicalTest.all
    @labs = nil
  end
  
  def about
    
  end
  
  def contact
    
  end

  def demoindex

  end
  
end
