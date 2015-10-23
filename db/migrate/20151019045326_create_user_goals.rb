class CreateUserGoals < ActiveRecord::Migration
  def change
    create_table :user_goals do |t|
      t.integer :numbers_of_words
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
