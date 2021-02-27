class AddDateColumn < ActiveRecord::Migration
    def change 
        add_column :entries, :date, :string
    end
end