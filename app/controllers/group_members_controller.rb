class GroupMembersController < ApplicationController
	def index
    @group_member = GroupMember.find :all
  end
  
  def show
    @group_member = GroupMember.find params[:id]
  end
  
  def new
    @group_member = GroupMember.new
  end
  
  def create
    @group_member = GroupMember.new params[:groupMember]
    if @group_member.save
      redirect_to :action => 'show', :id => @group_member.id
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @group_member = GroupMember.find params[:id]
    @group_member.destroy
  end
end
