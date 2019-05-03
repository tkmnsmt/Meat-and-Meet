class LikesController < ApplicationController

  before_action :authenticate_user!, only: [:index]

  def index
    @likes = Post.find(params[:post_id]).liked_users.order("id DESC").page(params[:page]).per(10)
  end

  def liked_posts
    @likes = User.find(params[:id]).liked_posts.order("id DESC").page(params[:page]).per(5)
  end

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.create(post_id: params[:post_id])
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    # redirect_back(fallback_location: root_path)
  end

end
