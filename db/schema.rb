# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 7) do

  create_table "entries", force: :cascade do |t|
    t.text    "content"
    t.integer "user_id"
    t.string  "date"
  end

  create_table "organizers", force: :cascade do |t|
    t.string  "date_of_tasks"
    t.integer "user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string  "task_name"
    t.integer "organizer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end
