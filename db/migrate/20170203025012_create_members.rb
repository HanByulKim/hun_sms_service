class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :phone
      t.integer :residence
      t.integer :elec_constit
      t.integer :support_ide
      t.integer :age
      t.integer :sex
      t.integer :recog
      t.integer :par_eval
      t.integer :support_re
      t.integer :support_gov
      t.integer :support_party
      t.integer :governer
      t.string :job
      t.string :position
      t.string :homenum
      t.string :compnum
      t.string :email
      t.string :recommender
      t.string :native
      t.integer :birth
      t.integer :partyfee

      t.timestamps null: false
    end
  end
end
