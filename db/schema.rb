# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_01_084923) do

  create_table "attachments", charset: "utf8", force: :cascade do |t|
    t.string "upload"
    t.string "t", limit: 20
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_attachments_on_user_id"
  end

  create_table "ckeditor_assets", charset: "utf8", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "clients", charset: "utf8", force: :cascade do |t|
    t.bigint "attachment_id"
    t.string "link"
    t.integer "order_position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_clients_on_attachment_id"
  end

  create_table "contact_users", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone", limit: 20
    t.string "subject"
    t.string "service"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fa_questions", charset: "utf8", force: :cascade do |t|
    t.string "ar_question", limit: 500
    t.string "en_question", limit: 500
    t.string "tr_question", limit: 500
    t.text "ar_answer"
    t.text "en_answer"
    t.text "tr_answer"
    t.integer "order_position", default: 0
    t.boolean "hidden", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_images", charset: "utf8", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "attachment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_post_images_on_attachment_id"
    t.index ["post_id"], name: "index_post_images_on_post_id"
  end

  create_table "post_types", charset: "utf8", force: :cascade do |t|
    t.string "ar_title"
    t.string "en_title"
    t.string "tr_title"
    t.string "slug", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_post_types_on_slug"
  end

  create_table "posts", charset: "utf8", force: :cascade do |t|
    t.bigint "post_type_id"
    t.bigint "attachment_id"
    t.string "ar_title"
    t.string "en_title"
    t.string "tr_title"
    t.string "ar_slug"
    t.string "en_slug"
    t.string "tr_slug"
    t.string "ar_subtitle"
    t.string "en_subtitle"
    t.string "tr_subtitle"
    t.text "ar_content"
    t.text "en_content"
    t.text "tr_content"
    t.integer "order_position", default: 0
    t.boolean "is_published", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ar_slug"], name: "index_posts_on_ar_slug"
    t.index ["attachment_id"], name: "index_posts_on_attachment_id"
    t.index ["en_slug"], name: "index_posts_on_en_slug"
    t.index ["post_type_id"], name: "index_posts_on_post_type_id"
    t.index ["tr_slug"], name: "index_posts_on_tr_slug"
  end

  create_table "sliders", charset: "utf8", force: :cascade do |t|
    t.bigint "attachment_id"
    t.string "link"
    t.string "ar_link_title"
    t.string "en_link_title"
    t.string "tr_link_title"
    t.string "ar_title"
    t.string "en_title"
    t.string "tr_subtitle"
    t.string "ar_subtitle"
    t.string "en_subtitle"
    t.string "tr_title"
    t.integer "order_position", default: 0
    t.boolean "hidden", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_sliders_on_attachment_id"
  end

  create_table "suppliers", charset: "utf8", force: :cascade do |t|
    t.bigint "attachment_id"
    t.string "link"
    t.integer "order_position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_suppliers_on_attachment_id"
  end

  create_table "support_locales", charset: "utf8", force: :cascade do |t|
    t.string "ar_title"
    t.string "en_title"
    t.string "tr_title"
    t.string "iso_code", limit: 3
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["iso_code"], name: "index_support_locales_on_iso_code"
  end

  create_table "team_members", charset: "utf8", force: :cascade do |t|
    t.bigint "attachment_id"
    t.string "ar_name"
    t.string "en_name"
    t.string "tr_name"
    t.string "ar_text"
    t.string "en_text"
    t.string "tr_text"
    t.integer "order_position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_team_members_on_attachment_id"
  end

  create_table "testimonials", charset: "utf8", force: :cascade do |t|
    t.string "ar_name"
    t.string "en_name"
    t.string "tr_name"
    t.string "ar_position"
    t.string "en_position"
    t.string "tr_position"
    t.string "ar_text"
    t.string "en_text"
    t.string "tr_text"
    t.integer "order_position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", limit: 100
    t.string "last_name", limit: 100
    t.boolean "super_admin", default: false
    t.string "locale", limit: 3, default: "en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "website_configs", charset: "utf8", force: :cascade do |t|
    t.string "ar_title"
    t.string "en_title"
    t.string "tr_title"
    t.string "slug"
    t.string "val"
    t.string "t", limit: 10, default: "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_website_configs_on_slug"
  end

  create_table "wpages", charset: "utf8", force: :cascade do |t|
    t.string "ar_title"
    t.string "en_title"
    t.string "tr_title"
    t.string "ar_slug"
    t.string "en_slug"
    t.string "tr_slug"
    t.text "ar_content"
    t.text "en_content"
    t.text "tr_content"
    t.boolean "show_header", default: false
    t.boolean "show_footer", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ar_slug"], name: "index_wpages_on_ar_slug"
    t.index ["en_slug"], name: "index_wpages_on_en_slug"
    t.index ["tr_slug"], name: "index_wpages_on_tr_slug"
  end

end
