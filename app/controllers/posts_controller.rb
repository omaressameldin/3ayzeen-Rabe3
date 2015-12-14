class PostsController < ApplicationController

  def index
    @user = User.find params[:id]
    @posts = Post.all.where(:receiver_id => @user.id)
    arr = Array.new
    @posts.each do |p|
    arr.push(p)
    end
    render json: arr
  end

  def show
    @post = Post.find params[:id]
    #render js: @post
    #render :json => @post, :include => tasks
    #render :json => @post, :callback => 'updateRecordDisplay'
    @user = User.find params[:id]
    @posts = Post.all.where(:receiver_id => @user.id)
    arr = Array.new
    @posts.each do |p|
    arr.push(p)
    end
    render json: arrs
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = 1                      #change later @post.user_id = current_user.user_id
    @post.receiver_id = 1                  #change later to get user_id from users/show
    if @post.save
      redirect_to :action => 'show', :id => @post.id
    else
      render :action => 'new'
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
