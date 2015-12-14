class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_1_id
      t.integer :user_2_id
      t.integer :status

      t.timestamps
    end
  end
end
