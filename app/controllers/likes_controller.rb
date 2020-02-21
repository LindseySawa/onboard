class LikesController < ApplicationController

  before_action :set_post, only: [:create, :destroy]

  # def create
  #   @like = current_user.likes.create(like_params)
  #   respond_to do |format|
  #     format.html{redirect_to @post}
  #     format.js
  #   end

  # end

  # def destroy
  #   @like = Like.find_by(like_params, user_id: current_user.id)
  #   @like.destroy
  #   respond_to do |format|
  #     format.html { redirect_to @post }
  #     format.js
  #   end
  # end

  # private
  # def set_post
  #   @post = Post.find(params[:post_id])
  # end
  # def like_params
  #   params.permit(:post_id)
  # end
  def create
  # @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
  # @likes = Like.where(post_id: params[:post_id])
  # @post = Post.find(params[:post_id])
  # @posts = Post.all
    @like = current_user.likes.create(like_params)
    @like.save!
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
    # redirect_to post_path(@post)
  end

  def destroy
    # @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
    # @like.destroy
    # render "destroy.js.erb"
    # @likes = Like.where(post_id: params[:post_id])
    # @post = Post.find(params[:post_id])
    # @posts = Post.all
    @like = Like.find_by(like_params, user_id: current_user.id)
    @like.destroy
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
    # redirect_to post_path(@post)

  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def like_params
    params.permit(:post_id)
  end


end
