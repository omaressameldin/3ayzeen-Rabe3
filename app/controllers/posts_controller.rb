class PostsController < ApplicationController
  def index
    # @post = Post.find :all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params[:post]
    current_user.user_id = 1
    @post.user_id = current_user.user_id
    @post.receiver_id = params[:id]
    @post.content = params[:content]
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
end
