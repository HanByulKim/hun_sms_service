class CreateLikevideos < ActiveRecord::Migration
  def change
    create_table :likevideos do |t|
      t.belongs_to :user
      t.belongs_to :video

      t.timestamps null: false
    end
  end
end
