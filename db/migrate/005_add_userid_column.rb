class AddUseridColumn < ActiveRecord::Migration
    def change 
        add_column :organizers, :user_id, :integer
    end
end