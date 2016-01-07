class CitiesController < ApplicationController
  def show
  	@city = City.friendly.find(params[:id])
    @posts = @city.posts.all.order("created_at DESC").page(params[:page]).per(4)
  end

  def selectcity
  	@city = City.find(city_params[:id])
  	redirect_to new_city_post_path(@city)
  end
private

  def city_params
    params.require(:city).permit(:id)
  end
end
