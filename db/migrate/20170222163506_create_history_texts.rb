class CreateHistoryTexts < ActiveRecord::Migration
  def change
    create_table :history_texts do |t|
      t.string :script
      t.integer :sender

      t.timestamps null: false
    end
  end
end
