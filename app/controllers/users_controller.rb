class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show]
  def show
    @user = User.find(params[:id])
    # @user = User.joins(:gender).find(params[:id])
    # @posts = Post.joins(:user)
    @post = Post.new
    @posts = Post.where(user_id: params[:id]).order("id DESC")
  end
end
