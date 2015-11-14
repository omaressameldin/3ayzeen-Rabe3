class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
  end
  def create
    @group = Group.new(group_params)
    #static for now
    @group.user_id = 1
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

  def nearby
    @group = Group.find()
    if(@group.privacy == 0)
    @users = User.where({user_id:12, status:2 })
  end

  def new
    @group = Group.new
  end

  def invite
  end

  private

  def group_params
    params.require(:group).permit(:activity_id, :privacy, :max_members, :start_time, :end_time, :x_loc, :y_loc)

   end


end
