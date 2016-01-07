class CitiesController < ApplicationController
  def show
  	@city = City.friendly.find(params[:id])
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(4)
  end
end
