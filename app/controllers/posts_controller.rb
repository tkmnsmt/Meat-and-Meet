class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    if params[:search] == nil
      @posts = Post.all.order("id DESC").page(params[:page]).per(5)
    elsif params[:search] == ""
      @posts = Post.all.order("id DESC").page(params[:page]).per(5)
    else
      #部分検索
      @posts = Post.where("restaurant_name LIKE ? ", '%' + params[:search] + '%').page(params[:page]).per(5)
    end
    # @posts = Post.all.order("id DESC").page(params[:page]).per(5)

    @post = Post.new
    @like = Like.new
    if user_signed_in? && current_user.name == nil || user_signed_in? && current_user.introduce == nil || user_signed_in? && current_user.name == "" || user_signed_in? && current_user.introduce == ""
      redirect_to profile_edit_path
    end
  end

  def show
    @post = Post.find(params[:id])
    # binding.pry
    @like = Like.new

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_new)
    @post.user_id = current_user.id
    @posts = Post.all.order("id DESC")
    if @post.save
      redirect_to action: "index"
    else
      render action: "index"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(params_new)
      redirect_to action: "show"
    else
      redirect_to action: "index"
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to action: "index"
  end

  private
  def params_new
    params.require(:post).permit(:image, :url, :address, :latitude, :longitude, :restaurant_name, :taste, :cost_performance, :service, :atmosphere, :reputation, :genre)
  end


end
