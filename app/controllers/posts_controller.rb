class PostsController < ApplicationController
  # before_action :set_post, except: [:new, :create]
  before_action :set_city, except: [:new]
  before_action :authorize, except: [:show]

  def new
    if current_user
      @post = Post.new
    else
      redirect_to user_path(current_user)
      flash[:error] = 'You are already logged in'
    end
  end

  def create
    #nested resource to build the post in the city show page
    @post = @city.posts.new(post_params)
    @post.user.id == current_user.id
    if @post.save
      redirect_to post_path(@post)
      flash[:notice] = 'Post successfully created'
    else
      redirect_to new_post_path
      flash[:error] = @post.errors.full_messages.join(', ')
    end
  end

  def show
  end

  def edit
    unless current_user.id == @post.user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    if current_user == @post.user
      if post.update_attributes(post_params)
        redirect_to post_path(@post)
        flash[:notice] = 'Post successfully updated'
      else
        redirect_to edit_post_path
        flash[:error] = @post.errors.full_messages.join(', ')
      end
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    if current_user == @post.user
      @post.destroy
      flash[:notice] = 'Post has been deleted'
    end
    redirect_to user_path(current_user)
  end

private
  
  # def set_post
  #   @post = Post.find(params[:id])
  # end
  def set_city
    @city = City.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title, :body, :city_id, :user_id)
  end
end
