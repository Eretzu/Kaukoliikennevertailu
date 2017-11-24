class PublicController < ApplicationController
  def home
    @cities = City.all
    if(params.has_key?(:date))
      day = Integer(params[:date][:day])
      month = Integer(params[:date][:month])
      date = Date.new(2017, month, day)
      @transports = Transportation.get(params[:departure], params[:arrive], date, params[:sorting])
      if(@transports == nil)
        @transports = []
      end
    else
      @transports = []
    end 
  end
end
