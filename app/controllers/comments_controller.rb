class CommentsController < ApplicationController
  def index
    @comment = Comment.find :all
  end

  def show
    @comment = Comment.find params[:id]
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
