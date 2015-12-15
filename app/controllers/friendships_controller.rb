class FriendshipsController < ApplicationController

  def create
    # @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friendship = Friendship.new
    @friendship.user_id = params[:user_id]
    @friendship.friend_id = params[:receiver_id]
    @friendship.status = "pending"
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to controller: 'users', action: 'index' , user_id: 1
    else
      flash[:notice] = "Unable to add friend."
      redirect_to controller: 'users', action: 'index'
    end
  end

  def destroy
    @friendship = Friendship.where("user_id = ?", params[:user_id]).where("friend_id = ?", params[:receiver_id])
    @friendship.destroy_all
    @friendship = Friendship.where("user_id = ?", params[:receiver_id]).where("friend_id = ?", params[:user_id])
    if @friendship.destroy_all
      flash[:notice] = "remove friend."
      redirect_to controller: 'users', action: 'index' , user_id: 1
    else
      flash[:notice] = "Unable to remove friend."
      redirect_to controller: 'users', action: 'index' , user_id: 1
    end
  end

end
