class CommentsController < ApplicationController
  
  before_filter :authorize

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    post_id = params.require(:comment).permit(:post_id)["post_id"]
    city_id = params.require(:comment).permit(:city_id)["city_id"]
  
    if comment.save
      redirect_to city_post_path(city_id, post_id)
    else
      redirect_to new_city_post_path
      flash[:error] = @comment.errors.full_messages.join(', ')
    end
  end

  def destroy
    comment_id = params[:id]
    comment = Comment.find(comment_id)
    post_id = comment.post_id
    post = Post.find(post_id)
    user_id = post.user_id
    post_id = params[:post_id]
    city_id = params[:city_id]
    
    if current_user.id == comment.user_id || post.user_id == current_user.id
      comment.destroy
      redirect_to city_post_path(city_id, post_id)
    end  
  end

private
  def comment_params
    params.require(:comment).permit(:line, :user_id, :post_id)
  end
end
