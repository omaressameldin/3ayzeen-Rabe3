class UsersController < ApplicationController
  
  def index
    @user = User.find :all
  end
  
  def show
    user = User.find params[:id]
  end
  
  def new
    user = User.new
  end
  
  def create
    user = User.new params[:user]
    if user.save
      redirect_to :action => 'show', :id => user.id
    else
      render :action => 'new'
    end
  end
  
  def destroy
    user = User.find params[:id]
    user.destroy
  end
  
end
