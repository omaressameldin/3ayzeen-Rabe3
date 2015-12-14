class PostsController < ApplicationController

  def index
    @user = User.find params[:id]
    @posts = Post.all.where(:receiver_id => @user.id)
    arr = Array.new
    @posts.each do |p|
    @comments = Comment.all.where(:post_id => p.id)
    p.comments = @comments  
    arr.push(p)
    arr.push(p.comments)
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
    @comments = Comment.all.where(:post_id => p.id)
    p.comments = @comments  
    arr.push(p)
    arr.push(p.comments)
    end
    render json: arr
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # @post.user_id = params[:user_id]                      #change later @post.user_id = current_user.user_id
    # @post.receiver_id = params[:receiver_id]                   #change later to get user_id from users/show
    # @post.content = params[:content]
    if @post.save
      redirect_to :action => 'index', :id => @post.receiver_id
      #redirect_to 'posts#show'
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
    #Post id: 1, user_id: 1, receiver_id: 1, content: "asdfgh",
    params.permit(:user_id, :receiver_id, :content)
  end

end
