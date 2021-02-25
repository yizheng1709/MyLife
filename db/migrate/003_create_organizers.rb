class CreateOrganizers < ActiveRecord::Migration
    create_table :organizers do |t|
        t.string :date_of_tasks
        t.text :tasks
    end
end