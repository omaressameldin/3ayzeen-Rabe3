class AddDetailsToGroupMember < ActiveRecord::Migration
  def change
    add_column :group_members, :status, :integer
  end
end
