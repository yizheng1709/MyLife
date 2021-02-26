class CreateTasks < ActiveRecord::Migration
    def change
        create_table :tasks do |t|
            t.string :task_name
            t.integer :organizer_id
        end
    end
end