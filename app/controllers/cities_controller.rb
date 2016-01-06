class CitiesController < ApplicationController
  def show
  	@city = City.friendly.find(params[:id])
    @posts = Post.all.page(params[:page]).per(6)
  end
end
