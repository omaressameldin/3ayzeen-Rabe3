class ActivitiesController < ApplicationController
  def index
    @activities = Activities.find :all
  end
  
  def show
    @activities = Activities.find params[:id]
  end
  
  def new
    @activities = Activities.new
  end
  
  def create
    @activities = Activities.new params[:activities]
    if @activities.save
      redirect_to :action => 'show', :id => @activities.id
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @activities = Activities.find params[:id]
    @activities.destroy
  end
end
