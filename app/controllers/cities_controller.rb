class CitiesController < ApplicationController
  def show
  	city_id = params[:id]
  	@city = City.find_by_id(city_id)
  end
end
