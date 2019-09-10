class AddNewToOpponents < ActiveRecord::Migration
    def change
        add_column :opponents, :new, :string
    end
end
