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

ActiveRecord::Schema.define(version: 20140303023355) do

  create_table "comments", force: true do |t|
    t.string   "html_url"
    t.string   "url"
    t.integer  "remote_id"
    t.text     "body"
    t.string   "path"
    t.integer  "position"
    t.integer  "line"
    t.string   "commit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commits", force: true do |t|
    t.string   "sha"
    t.string   "message"
    t.string   "author_name"
    t.string   "author_email"
    t.string   "url"
    t.boolean  "distinct"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "event_type"
  end

  create_table "events", force: true do |t|
    t.string   "type"
    t.integer  "repository_id"
    t.integer  "remote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "import_id"
    t.integer  "user_id"
    t.text     "raw_data"
    t.datetime "occurred_at"
    t.string   "head"
    t.string   "ref"
    t.integer  "size"
    t.integer  "comment_id"
    t.string   "ref_type"
    t.string   "master_branch"
    t.string   "description"
    t.text     "payload"
    t.string   "sha"
    t.string   "state"
    t.string   "target_url"
    t.string   "action"
    t.integer  "pull_request_id"
    t.integer  "issue_id"
    t.string   "target_user"
  end

  create_table "imports", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", force: true do |t|
    t.string   "url"
    t.integer  "remote_id"
    t.integer  "number"
    t.string   "title"
    t.string   "creator"
    t.string   "state"
    t.string   "assignee"
    t.string   "milestone"
    t.integer  "comments"
    t.datetime "remote_created_at"
    t.datetime "closed_at"
    t.boolean  "pull_request"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repository_id"
  end

  create_table "pull_requests", force: true do |t|
    t.string   "url"
    t.integer  "number"
    t.string   "state"
    t.string   "title"
    t.text     "body"
    t.datetime "remote_created_at"
    t.datetime "closed_at"
    t.datetime "merged_at"
    t.string   "head_sha"
    t.string   "head_ref"
    t.string   "base_sha"
    t.string   "base_ref"
    t.string   "merge_commit_sha"
    t.boolean  "merged"
    t.boolean  "mergeable"
    t.string   "merged_by"
    t.integer  "comments"
    t.integer  "commits"
    t.integer  "additions"
    t.integer  "deletions"
    t.integer  "changed_files"
    t.integer  "repository_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "milestone"
    t.string   "assignee"
    t.string   "mergeable_state"
    t.integer  "remote_id"
  end

  create_table "repositories", force: true do |t|
    t.string   "name"
    t.string   "owner"
    t.boolean  "private"
    t.boolean  "fork"
    t.integer  "remote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
