class PublicController < ApplicationController
  def home
    @transports = Transportation.get(params[:departure], params[:arrive], params[:sorting])
    
    @cities = City.all
    
    @TrainCO2 = 100
    @BusCO2 = 200
    @PlaneCO2 = 500
  end
end
