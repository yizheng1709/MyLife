class CreateEntries < ActiveRecord::Migration
    create_table :entries do |t|
         t.string :title
         t.text :content
         t.integer :user_id
    end 
end