class CreateActivitySuggestions < ActiveRecord::Migration
  def change
    create_table :activity_suggestions do |t|
      t.integer :user_id
      t.string :activity
      t.text :des

      t.timestamps
    end
  end
end
