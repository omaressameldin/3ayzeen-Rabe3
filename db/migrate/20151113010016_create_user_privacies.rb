class CreateUserPrivacies < ActiveRecord::Migration
  def change
    create_table :user_privacies do |t|
      t.integer :user_id
      t.integer :activity_id
      t.integer :privacy

      t.timestamps
    end
  end
end
