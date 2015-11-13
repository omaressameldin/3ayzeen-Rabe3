class GroupsController < ApplicationController
  def index
    @group = Group.find :all
  end
  
  def show
    @group = Group.find params[:id]
  end
  
  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new params[:group]
    if @group.save
      redirect_to :action => 'show', :id => @group.id
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @group = Group.find params[:id]
    @group.destroy
  end
end
