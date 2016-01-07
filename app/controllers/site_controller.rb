class SiteController < ApplicationController
  def index
  	@cities = City.all
  end
end
