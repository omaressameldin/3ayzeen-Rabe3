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
    @comment = Comment.new params[:comment]
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
end
