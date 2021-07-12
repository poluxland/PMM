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

ActiveRecord::Schema.define(version: 2021_07_12_234258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.datetime "published_at"
    t.string "announcement_type"
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "brus", force: :cascade do |t|
    t.date "fecha"
    t.time "ingreso"
    t.time "salida"
    t.string "patente"
    t.string "mmpp"
    t.string "comentarios"
    t.integer "numero"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "canchas", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "capacidad"
    t.boolean "operativa"
    t.bigint "mmpp_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mmpp_id"], name: "index_canchas_on_mmpp_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.string "nombre"
    t.date "fecha"
    t.string "cinta"
    t.string "lubricacion"
    t.string "aseos"
    t.string "nivel"
    t.string "fugas"
    t.integer "presion"
    t.string "filtro1"
    t.string "filtro2"
    t.string "polvo"
    t.string "raspador"
    t.string "iluminacion"
    t.text "comentarios"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cuasis", force: :cascade do |t|
    t.string "sitio"
    t.date "fecha"
    t.string "reporta"
    t.string "potencial"
    t.string "accion"
    t.string "responsable"
    t.string "estado"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "derrames", force: :cascade do |t|
    t.integer "EM22"
    t.integer "Sepax"
    t.integer "Filtax"
    t.integer "Puzolana"
    t.integer "Yeso"
    t.integer "Silo_KKI"
    t.integer "cola_H9"
    t.integer "Aire_terciario"
    t.integer "Filtro_enfriadera"
    t.integer "EM21"
    t.integer "Aux_H9"
    t.integer "Skako"
    t.integer "Niagara"
    t.integer "CI08F01"
    t.integer "Coke"
    t.integer "Exterior_molinos_MP"
    t.integer "Cintas_MP"
    t.text "comentarios"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "estado_edificios", force: :cascade do |t|
    t.integer "Em22"
    t.integer "Em21"
    t.integer "Kki"
    t.integer "Kkm"
    t.integer "Puzolana"
    t.integer "Yeso"
    t.integer "Trans_cemento"
    t.integer "Enfriadera"
    t.integer "Techo_ccm_h9"
    t.integer "Patio_M22"
    t.integer "Niagara"
    t.integer "EM17"
    t.integer "Bba_flux"
    t.integer "Area_202"
    t.integer "Basculas"
    t.integer "Em_18_19"
    t.integer "Taller_electrico"
    t.integer "CI01CK01"
    t.integer "Silos_superiores"
    t.integer "Secador"
    t.text "comentarios"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "lvs", force: :cascade do |t|
    t.string "proceso"
    t.string "obervado"
    t.string "observador"
    t.string "altura"
    t.string "izaje"
    t.string "eemm"
    t.string "lototo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mmpps", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "densidad"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "recipient_id"
    t.bigint "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.bigint "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recuperados", force: :cascade do |t|
    t.float "EM22"
    t.float "Sepax"
    t.float "Filtax"
    t.float "Puzolana"
    t.float "Yeso"
    t.float "Silo_KKI"
    t.float "cola_H9"
    t.float "Aire_terciario"
    t.float "Filtro_enfriadera"
    t.float "EM21"
    t.float "Aux_H9"
    t.float "Skako"
    t.float "Niagara"
    t.float "CI08F01"
    t.float "Coke"
    t.float "Exterior_molinos_MP"
    t.float "Cintas_MP"
    t.text "comentarios"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "registros", force: :cascade do |t|
    t.bigint "cancha_id", null: false
    t.integer "uso"
    t.string "fotografia"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cancha_id"], name: "index_registros_on_cancha_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider"
    t.string "uid"
    t.string "access_token"
    t.string "access_token_secret"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.text "auth"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.date "fecha"
    t.bigint "mmpp_id", null: false
    t.string "tipo"
    t.time "llegada"
    t.time "llamada"
    t.time "salida"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "patente"
    t.integer "wait"
    t.string "cause"
    t.text "motive"
    t.integer "number"
    t.string "other"
    t.index ["mmpp_id"], name: "index_trucks_on_mmpp_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "announcements_last_read_at"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "canchas", "mmpps"
  add_foreign_key "registros", "canchas"
  add_foreign_key "services", "users"
  add_foreign_key "trucks", "mmpps"
end
