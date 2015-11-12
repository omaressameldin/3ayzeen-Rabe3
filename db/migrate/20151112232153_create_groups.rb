class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :user_id
      t.integer :activity_id
      t.integer :privacy
      t.integer :max_members
      t.timestamp :start_time
      t.timestamp :end_time
      t.float :x_loc
      t.float :y_loc
      t.timestamps
    end
  end
end
