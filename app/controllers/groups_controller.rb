class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
  end
  def create
    @group = Group.new(group_params)
    @group.user_id = 1
    # @group.activity_id = params[:activity_id]
    # @group.privacy = params[:privacy]
    # @group.max_members = params[:max_members]
    # #@group.start_time = params[:start_time]
    # #@group.end_time = params[:end_time]
    # @group.x_loc = params[:x_loc]
    # @group.y_loc = params[:y_loc]
    if @group.save
      @groupM = GroupMember.new
      @groupM.group_id = @group.id
      @groupM.user_id = @group.user_id
      if @groupM.save
          redirect_to "/groups/" + @group.id.to_s
      else
        redirect_to('/groups/new')
      end
    else
      redirect_to('/groups/new')
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  private

  def group_params
    params.require(:group).permit(:activity_id, :privacy, :max_members, :start_time, :end_time, :x_loc, :y_loc) 

   end


end
