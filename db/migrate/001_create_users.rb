class CreateUsers < ActiveRecord::Migration
    create_table :users do |t|
        t.string :username
        t.password_digest
    end
end