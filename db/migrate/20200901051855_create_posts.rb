class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id, null:false, foreign_key: true
      t.integer :topic_id, null:false, foreign_key: true
      t.text :body, null:false
      t.timestamps
    end
  end
end
