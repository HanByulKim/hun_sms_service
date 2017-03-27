class CreateCommentvideos < ActiveRecord::Migration
  def change
    create_table :commentvideos do |t|
      t.text :script
      t.integer :video_id
      t.integer :user_id
      t.boolean :blind

      t.timestamps null: false
    end
  end
end
