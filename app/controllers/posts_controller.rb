class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :about]

  def index
    @posts = Post.order("created_at DESC").limit(8)
    @rank = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def new
    @post = Post.new

  end

  def create
    @post = current_user.posts.create(post_params)
    @post.save
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.where(user_id: @post.user_id).order("RAND()").limit(6)
    @others = Post.where.not(user_id: @post.user_id).order("RAND()").limit(6)
    # @comments = @post.comments.includes(:user)
    # @comment = Comment.new
    @comments = @post.comments
    @comment = @post.comments.build
    @like = Like.new
    @likes_count = Like.where(post_id: @post.id)
    @user = User.find_by(id: @post.user_id)

  end

  # def place 
  #   @posts = Post.order("created_at DESC").page(params[:page]).per(60)
  # end

  def search
    # @q = Post.ransack(params[:q])
    # @results = @q.result
    # @result_item = Results.order("created_at DESC").page(params[:page]).per(9)
    @posts = Post.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(60)
    respond_to do |format|
      format.html
      format.json
    end
    # @results = @posts.result
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.user_id == current_user.id
        @post.update(post_params)
      end
    redirect_to posts_path
  end

  def destroy
    @post = Post.find(params[:id])
      if @post.user_id == current_user.id
        @post.destroy
      end
    redirect_to posts_path
  end

  def about
    
  end


  private
  def post_params
    params.require(:post).permit(:image, :title, :country, :city, :how, :discription, :like_count)
  end

  
end
