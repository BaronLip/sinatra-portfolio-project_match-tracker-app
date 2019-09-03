class CreateOpponents < ActiveRecord::Migration
  def change
    create_table :opponents do |t|
        t.string :username
        t.integer :age
        t.string :gender
        t.text :address
        t.string :email
        t.timestamps null: false
    end
  end
end
