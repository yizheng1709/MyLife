class CreateEntries < ActiveRecord::Migration
    create_table :entries do |t|
         t.string :title
         t.text :content
         t.user_id :integer
    end 
end