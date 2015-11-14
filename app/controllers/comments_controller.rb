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
    @comment.user_id = 1                                   #change it to session[:id]
    @comment.post_id = 1                                   #change it to value of post_id
    if @comment.save
      redirect_to :action => 'show', :id => @comment.id
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
    params.require(:comment).permit(:content)
  end

end
