class CommentsController < ApplicationController
  def index
    @comment = Comment.find :all
  end

  def show
    @comment = Comment.find params[:id]

    @post = Post.find params[:id]
    #render js: @post
    #render :json => @post, :include => tasks
    #render :json => @post, :callback => 'updateRecordDisplay'
    @user = User.find params[:id]
    @posts = Post.all.where(:receiver_id => @user.id)
    arr = Array.new
    @posts.each do |p|
    @comments = Comment.all.where(:post_id => p.id)  
    arr.push(p)
    #arr.push(p.comments)
    end
    render json: @post.comments

  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new comment_params
    @post = Post.find(@comment.post_id)
    #@comment.user_id = 1                                   #change it to session[:id]
    #@comment.post_id = 1                                   #change it to value of post_id
    if @comment.save
      redirect_to :controller => 'posts', :action => 'index', :id => @post.receiver_id
    else
      render :action => 'new'
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
  end

  private

  def comment_params
    params.permit(:user_id, :post_id, :content)
  end

end
