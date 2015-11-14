class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
  end

  def create
    @activity = Activity.new(activity_params)
    if(!@activity.save)
      flash[:notice] = @activity.errors.messages.first
    end
      redirect_to "/activities"
  end

  def new
    @activity = Activity.new
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :des)

   end

end
