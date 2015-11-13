class PostsController < ApplicationController

  def index
    @post = Post.find :all
  end

  def show
    @post = Post.find params[:id]
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
