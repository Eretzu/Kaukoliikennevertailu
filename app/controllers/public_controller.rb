class PublicController < ApplicationController
  def home
    day = Integer(params[:date][:day])
    month = Integer(params[:date][:month])
    date = Date.new(2017, month, day)
    @transports = Transportation.get(params[:departure], params[:arrive], date, params[:sorting])
    
    @cities = City.all
    
    @TrainCO2 = 100
    @BusCO2 = 200
    @PlaneCO2 = 500
  end
end
