class PublicController < ApplicationController
  def home
    @cities = City.all
    
    @TrainCO2 = 100
    @BusCO2 = 200
    @PlaneCO2 = 500
  end
end
