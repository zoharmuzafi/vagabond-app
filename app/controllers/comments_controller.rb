class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @posts.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to city_post_path(@post)
      flash[:notice] = 'Comment has been added'
    else
      redirect_to new_city_post_path
      flash[:error] = @comment.errors.full_messages.join(', ')
    end
  end

  def update
    @comment = @post.comments.find(params[:id])
    if current_user == @post.user
      if @comment.update_attributes(comment_params)
        redirect_to city_post_path(@post)
        flash[:notice] = 'Comment has been updated'
      else
        redirect_to edit_city_post_path(@post)
        flash[:error] = 'Generic error message here'
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    if current_user == @comment
      @comment.destroy
      flash[:notice] = 'Comment has been deleted'
    end
    redirect_to city_path
  end

private
  def set_post
    @post = Post.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:line, :user_id, :post_id)
  end
end
