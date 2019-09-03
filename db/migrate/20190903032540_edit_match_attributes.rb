class EditMatchAttributes < ActiveRecord::Migration
    def change
        change_column :matches, :user_score, :integer
        change_column :matches, :opponent_score, :integer
        change_column :matches, :user_notes, :text
    end
end
