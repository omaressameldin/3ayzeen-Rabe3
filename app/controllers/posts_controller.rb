class PostsController < ApplicationController
  def create
    @post = Post.new
  end
end
