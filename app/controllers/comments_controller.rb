class CommentsController < ApplicationController
  before_action :set_post
  before_filter :authorize

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.line = "#{current_user.name}: #{comment.line}"
    if comment.save
      redirect_to city_post_path(@post)
    else
      redirect_to new_city_post_path
      flash[:error] = @comment.errors.full_messages.join(', ')
    end
  end

  # def update
  #   @comment = @post.comments.find(params[:id])
  #   if current_user == @post.user
  #     if @comment.update_attributes(comment_params)
  #       redirect_to city_post_path(@post)
  #       flash[:notice] = 'Comment has been updated'
  #     else
  #       redirect_to edit_city_post_path(@post)
  #       flash[:error] = 'Generic error message here'
  #     end
  #   end
  # end

  def destroy
    comment_id = params[:id]
    comment = Comment.find(comment_id)
    post_id = comment.post_id
    post = Post.find(post_id)
    user_id = post.user_id
    if current_user.id == comment.user_id || post.user_id == current_user.id
      comment.destroy
      redirect_to city_path 
    end  
  end

private
  def set_post
    @post = Post.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:line, :user_id, :post_id)
  end
end
