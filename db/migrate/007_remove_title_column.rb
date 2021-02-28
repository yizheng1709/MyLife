class RemoveTitleColumn < ActiveRecord::Migration
    def change 
        remove_column :entries, :title
    end
end