class ModifyFriendsModel < ActiveRecord::Migration
  def change

    remove_column :friends, :user_1_id, :integer
    remove_column :friends, :user_2_id, :integer
    add_column :friends, :user_id, :integer
    add_column :friends, :friend_id, :integer
    rename_table :friends, :friendships
  end
end
