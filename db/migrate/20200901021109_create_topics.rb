class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.integer :user_id, null:false, foreign_key: true
      t.string :title, null:false
      t.integer :category_id, null:false
      t.timestamps
    end
  end
end
