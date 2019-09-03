class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
        # "date" refers to the date of the match.
        t.string :date
        t.integer :user_id
        t.string :user_score
        t.string :user_notes    
        t.integer :opponent_id
        t.string :opponent_score
        t.datetime :created_at
        t.datetime :updated_at
        t.timestamps null: false
    end
  end
end
