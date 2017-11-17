class PublicController < ApplicationController
  def home
    @cities = City.all
  end
end
