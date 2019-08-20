class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show]
  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = Post.where(user_id: params[:id]).order("id DESC").page(params[:page]).per(10)
    
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end

    if user_signed_in? && current_user.name == nil || user_signed_in? && current_user.introduce == nil || user_signed_in? && current_user.name == "" || user_signed_in? && current_user.introduce == ""
      redirect_to profile_edit_path
    end

  end
end
