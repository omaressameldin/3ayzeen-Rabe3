class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    # @user2 = User.new
    # @user2.user_id = params[:id]        # use this to send receiver_id to post#create
    @post = Post.new
    @myPost = Post.new

    @myPost = Post.where({user_id: params[:id]})
    @myPostc = @myPost.all.includes(:comments)
    @comment = Comment.new
    @friendship = Friendship.all.where("user_id = ?", @user.id)
    arr = Array.new
    @friendship.each do |f|
    arr.push(f.friend_id)
    end
    @friendship = Friendship.all.where("friend_id = ?", @user.id)
    @friendship.each do |f|
    arr.push(f.user_id)
    end
    render json: arr
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to :action => 'show', :id => @user.id
    else
      render :action => 'new'
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
  end

  def edit
    @user = User.find(params[:id])
    if current_user == @user
      render 'new'
    else
      redirect_to({ action: "index"})
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to({ action: "index"})
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :image, :x_loc, :y_loc, :gender, :available, :phone_number)
  end

end
