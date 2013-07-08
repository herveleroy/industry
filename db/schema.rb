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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130707094429) do

  create_table "butterflies", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "author_id"
    t.string   "customer_segments"
    t.string   "value_proposal"
    t.string   "channels"
    t.string   "customer_relationship"
    t.string   "key_resources"
    t.string   "key_activities"
    t.string   "key_partnerships"
    t.string   "revenue_streams"
    t.string   "cost_structure"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "cached_votes_total",    :default => 0
    t.integer  "cached_votes_score",    :default => 0
    t.integer  "cached_votes_up",       :default => 0
    t.integer  "cached_votes_down",     :default => 0
    t.boolean  "delta",                 :default => true, :null => false
    t.string   "state"
    t.integer  "challenge"
  end

  add_index "butterflies", ["cached_votes_down"], :name => "index_butterflies_on_cached_votes_down"
  add_index "butterflies", ["cached_votes_score"], :name => "index_butterflies_on_cached_votes_score"
  add_index "butterflies", ["cached_votes_total"], :name => "index_butterflies_on_cached_votes_total"
  add_index "butterflies", ["cached_votes_up"], :name => "index_butterflies_on_cached_votes_up"

  create_table "butterflies_knowledges", :force => true do |t|
    t.integer  "butterfly_id"
    t.integer  "knowledge_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "caterpillars", :force => true do |t|
    t.string   "title"
    t.integer  "author_id"
    t.text     "description"
    t.text     "application"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "delta",              :default => true, :null => false
    t.string   "state"
    t.integer  "cached_votes_total", :default => 0
    t.integer  "cached_votes_score", :default => 0
    t.integer  "cached_votes_up",    :default => 0
    t.integer  "cached_votes_down",  :default => 0
    t.integer  "challenge"
  end

  add_index "caterpillars", ["cached_votes_down"], :name => "index_caterpillars_on_cached_votes_down"
  add_index "caterpillars", ["cached_votes_score"], :name => "index_caterpillars_on_cached_votes_score"
  add_index "caterpillars", ["cached_votes_total"], :name => "index_caterpillars_on_cached_votes_total"
  add_index "caterpillars", ["cached_votes_up"], :name => "index_caterpillars_on_cached_votes_up"

  create_table "caterpillars_chrysalis", :force => true do |t|
    t.integer  "caterpillar_id"
    t.integer  "chrysali_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "caterpillars_chrysalis", ["caterpillar_id"], :name => "index_caterpillars_chrysalis_on_caterpillar_id"
  add_index "caterpillars_chrysalis", ["chrysali_id"], :name => "index_caterpillars_chrysalis_on_chrysali_id"

  create_table "caterpillars_knowledges", :force => true do |t|
    t.integer  "caterpillar_id"
    t.integer  "knowledge_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "caterpillars_knowledges", ["caterpillar_id"], :name => "index_caterpillars_knowledges_on_caterpillar_id"
  add_index "caterpillars_knowledges", ["knowledge_id"], :name => "index_caterpillars_knowledges_on_knowledge_id"

  create_table "challenges", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_at"
    t.date     "end_at"
    t.integer  "owner_id"
    t.string   "state"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "chrysalis", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "author_id"
    t.string   "state"
    t.string   "value_proposal"
    t.string   "application"
    t.string   "conditions"
    t.string   "obstacles"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "cached_votes_total", :default => 0
    t.integer  "cached_votes_score", :default => 0
    t.integer  "cached_votes_up",    :default => 0
    t.integer  "cached_votes_down",  :default => 0
    t.boolean  "delta",              :default => true, :null => false
    t.integer  "challenge"
  end

  add_index "chrysalis", ["cached_votes_down"], :name => "index_chrysalis_on_cached_votes_down"
  add_index "chrysalis", ["cached_votes_score"], :name => "index_chrysalis_on_cached_votes_score"
  add_index "chrysalis", ["cached_votes_total"], :name => "index_chrysalis_on_cached_votes_total"
  add_index "chrysalis", ["cached_votes_up"], :name => "index_chrysalis_on_cached_votes_up"

  create_table "chrysalis_butterflies", :force => true do |t|
    t.integer  "butterfly_id"
    t.integer  "chrysali_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "chrysalis_knowledges", :force => true do |t|
    t.integer  "chrysali_id"
    t.integer  "knowledge_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "chrysalis_knowledges", ["chrysali_id"], :name => "index_chrysalis_knowledges_on_chrysalis_id"
  add_index "chrysalis_knowledges", ["knowledge_id"], :name => "index_chrysalis_knowledges_on_knowledge_id"

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id",   :default => 0
    t.string   "commentable_type", :default => ""
    t.string   "title",            :default => ""
    t.text     "body"
    t.string   "subject",          :default => ""
    t.integer  "user_id",          :default => 0,  :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
  end

  create_table "entities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "forem_categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "forem_categories", ["slug"], :name => "index_forem_categories_on_slug", :unique => true

  create_table "forem_forums", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", :default => 0
    t.string  "slug"
  end

  add_index "forem_forums", ["slug"], :name => "index_forem_forums_on_slug", :unique => true

  create_table "forem_groups", :force => true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], :name => "index_forem_groups_on_name"

  create_table "forem_memberships", :force => true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], :name => "index_forem_memberships_on_group_id"

  create_table "forem_moderator_groups", :force => true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], :name => "index_forem_moderator_groups_on_forum_id"

  create_table "forem_posts", :force => true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "reply_to_id"
    t.string   "state",       :default => "pending_review"
    t.boolean  "notified",    :default => false
  end

  add_index "forem_posts", ["reply_to_id"], :name => "index_forem_posts_on_reply_to_id"
  add_index "forem_posts", ["state"], :name => "index_forem_posts_on_state"
  add_index "forem_posts", ["topic_id"], :name => "index_forem_posts_on_topic_id"
  add_index "forem_posts", ["user_id"], :name => "index_forem_posts_on_user_id"

  create_table "forem_subscriptions", :force => true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.boolean  "locked",       :default => false,            :null => false
    t.boolean  "pinned",       :default => false
    t.boolean  "hidden",       :default => false
    t.datetime "last_post_at"
    t.string   "state",        :default => "pending_review"
    t.integer  "views_count",  :default => 0
    t.string   "slug"
  end

  add_index "forem_topics", ["forum_id"], :name => "index_forem_topics_on_forum_id"
  add_index "forem_topics", ["slug"], :name => "index_forem_topics_on_slug", :unique => true
  add_index "forem_topics", ["state"], :name => "index_forem_topics_on_state"
  add_index "forem_topics", ["user_id"], :name => "index_forem_topics_on_user_id"

  create_table "forem_views", :force => true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             :default => 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], :name => "index_forem_views_on_updated_at"
  add_index "forem_views", ["user_id"], :name => "index_forem_views_on_user_id"
  add_index "forem_views", ["viewable_id"], :name => "index_forem_views_on_topic_id"

  create_table "ideas", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "author_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "cached_votes_total", :default => 0
    t.integer  "cached_votes_score", :default => 0
    t.integer  "cached_votes_up",    :default => 0
    t.integer  "cached_votes_down",  :default => 0
    t.boolean  "delta",              :default => true, :null => false
    t.integer  "challenge"
  end

  add_index "ideas", ["cached_votes_down"], :name => "index_ideas_on_cached_votes_down"
  add_index "ideas", ["cached_votes_score"], :name => "index_ideas_on_cached_votes_score"
  add_index "ideas", ["cached_votes_total"], :name => "index_ideas_on_cached_votes_total"
  add_index "ideas", ["cached_votes_up"], :name => "index_ideas_on_cached_votes_up"

  create_table "ideas_caterpillars", :force => true do |t|
    t.integer  "idea_id"
    t.integer  "caterpillar_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "ideas_caterpillars", ["caterpillar_id"], :name => "index_ideas_caterpillars_on_caterpillar_id"
  add_index "ideas_caterpillars", ["idea_id"], :name => "index_ideas_caterpillars_on_idea_id"

  create_table "ideas_knowledges", :force => true do |t|
    t.integer  "idea_id"
    t.integer  "knowledge_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "ideas_knowledges", ["idea_id"], :name => "index_ideas_knowledges_on_idea_id"
  add_index "ideas_knowledges", ["knowledge_id"], :name => "index_ideas_knowledges_on_knowledge_id"

  create_table "knowledges", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "author"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "delta",       :default => true, :null => false
    t.integer  "user_id"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string  "name"
    t.boolean "taxon", :default => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.date     "due_date"
    t.boolean  "completed"
    t.integer  "taskable_id"
    t.string   "taskable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.text     "description"
    t.integer  "importance"
    t.integer  "accessibility"
  end

  create_table "taxinomies", :force => true do |t|
    t.string   "dimension"
    t.integer  "tag_id"
    t.integer  "position"
    t.integer  "weight"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taxon_rules", :force => true do |t|
    t.text     "tags"
    t.integer  "taxon"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "uploads", :force => true do |t|
    t.string   "name"
    t.integer  "uploadable"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",               :null => false
    t.string   "encrypted_password",     :default => "",               :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "entity_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "current_challenge"
    t.boolean  "forem_admin",            :default => false
    t.string   "forem_state",            :default => "pending_review"
    t.boolean  "forem_auto_subscribe",   :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], :name => "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["votable_id", "votable_type"], :name => "index_votes_on_votable_id_and_votable_type"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], :name => "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
