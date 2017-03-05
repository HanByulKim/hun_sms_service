class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :subtitle
      t.string :script
      t.date :posted
      t.string :imgurl
      t.integer :publisher

      t.timestamps null: false
    end
  end
end
