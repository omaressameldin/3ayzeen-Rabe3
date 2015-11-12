class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :image
      t.float :x_loc
      t.float :y_loc
      t.boolean :gender
      t.boolean :available
      t.string :phone_number
      t.timestamp :dob
      t.timestamps
    end
  end
end
