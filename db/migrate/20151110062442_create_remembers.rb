class CreateRemembers < ActiveRecord::Migration
  def change
    create_table :remembers do |t|
      t.integer :user_id
      t.integer :vocabulary_id

      t.timestamps null: false
    end
  end
end
