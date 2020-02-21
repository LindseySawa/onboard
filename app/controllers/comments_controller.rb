class CommentsController < ApplicationController
  # def create
  #   @comment = current_user.comments.build(comment_params)
  #   if @comment.save
  #     redirect_to root_path
  #   else
  #     redirect_to root_path
  #   end
  # end

  # private
  # def comment_params
  #   params.require(:comment).permit(:content,:post_id)
  # end
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      respond_to do |format|
        format.html {redirect_back(fallback_location: root_path)}
        format.json
      end
    #   # redirect_back(fallback_location: root_path)
    # else
    #   redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
    @comment.user_id = current_user.id
    if @comment.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
