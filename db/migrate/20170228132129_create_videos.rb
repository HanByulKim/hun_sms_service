class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :subtitle
      t.string :videoid
      t.string :videolink
      t.integer :publisher

      t.timestamps null: false
    end
  end
end
