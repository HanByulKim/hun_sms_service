class CreateLikenews < ActiveRecord::Migration
  def change
    create_table :likenews do |t|
      t.belongs_to :user
      t.belongs_to :news

      t.timestamps null: false
    end
  end
end
