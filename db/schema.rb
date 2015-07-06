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

ActiveRecord::Schema.define(version: 20140304000137) do

  create_table "comments", force: :cascade do |t|
    t.string   "html_url",   limit: 255
    t.string   "url",        limit: 255
    t.integer  "remote_id"
    t.text     "body"
    t.string   "path",       limit: 255
    t.integer  "position"
    t.integer  "line"
    t.string   "commit_id",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commits", force: :cascade do |t|
    t.string   "sha",          limit: 255
    t.string   "message",      limit: 255
    t.string   "author_name",  limit: 255
    t.string   "author_email", limit: 255
    t.string   "url",          limit: 255
    t.boolean  "distinct"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "event_type",   limit: 255
  end

  create_table "events", force: :cascade do |t|
    t.string   "type",            limit: 255
    t.integer  "repository_id"
    t.integer  "remote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "import_id"
    t.integer  "user_id"
    t.text     "raw_data"
    t.datetime "occurred_at"
    t.string   "head",            limit: 255
    t.string   "ref",             limit: 255
    t.integer  "size"
    t.integer  "comment_id"
    t.string   "ref_type",        limit: 255
    t.string   "master_branch",   limit: 255
    t.string   "description",     limit: 255
    t.text     "payload"
    t.string   "sha",             limit: 255
    t.string   "state",           limit: 255
    t.string   "target_url",      limit: 255
    t.string   "action",          limit: 255
    t.integer  "pull_request_id"
    t.integer  "issue_id"
    t.string   "target_user",     limit: 255
    t.integer  "release_id"
  end

  create_table "imports", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", force: :cascade do |t|
    t.string   "url",               limit: 255
    t.integer  "remote_id"
    t.integer  "number"
    t.string   "title",             limit: 255
    t.string   "creator",           limit: 255
    t.string   "state",             limit: 255
    t.string   "assignee",          limit: 255
    t.string   "milestone",         limit: 255
    t.integer  "comments"
    t.datetime "remote_created_at"
    t.datetime "closed_at"
    t.boolean  "pull_request"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "repository_id"
  end

  create_table "pull_requests", force: :cascade do |t|
    t.string   "url",               limit: 255
    t.integer  "number"
    t.string   "state",             limit: 255
    t.string   "title",             limit: 255
    t.text     "body"
    t.datetime "remote_created_at"
    t.datetime "closed_at"
    t.datetime "merged_at"
    t.string   "head_sha",          limit: 255
    t.string   "head_ref",          limit: 255
    t.string   "base_sha",          limit: 255
    t.string   "base_ref",          limit: 255
    t.string   "merge_commit_sha",  limit: 255
    t.boolean  "merged"
    t.boolean  "mergeable"
    t.string   "merged_by",         limit: 255
    t.integer  "comments"
    t.integer  "commits"
    t.integer  "additions"
    t.integer  "deletions"
    t.integer  "changed_files"
    t.integer  "repository_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "milestone",         limit: 255
    t.string   "assignee",          limit: 255
    t.string   "mergeable_state",   limit: 255
    t.integer  "remote_id"
  end

  create_table "releases", force: :cascade do |t|
    t.string   "url",               limit: 255
    t.integer  "remote_id"
    t.string   "tag_name",          limit: 255
    t.string   "target_commitish",  limit: 255
    t.string   "name",              limit: 255
    t.text     "body"
    t.boolean  "draft"
    t.boolean  "prerelease"
    t.datetime "remote_created_at"
    t.string   "author",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.integer  "repository_id"
  end

  create_table "repositories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "owner",      limit: 255
    t.boolean  "private"
    t.boolean  "fork"
    t.integer  "remote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.string   "auth_token", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
