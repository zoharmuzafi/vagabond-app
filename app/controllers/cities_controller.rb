class CitiesController < ApplicationController
  def show
  	@city = City.friendly.find(params[:id])
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(4)
  end

  def selectcity
  	city = params.require(:city).permit(:city_id)["city_id"]
  	find_city= City.find(city)
  	redirect_to new_city_post_path(find_city)
  end
end
