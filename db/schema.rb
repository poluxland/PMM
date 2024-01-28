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

ActiveRecord::Schema.define(version: 2024_01_28_011239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
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

  create_table "aprs", force: :cascade do |t|
    t.string "nombre"
    t.string "rut"
    t.string "cargo"
    t.integer "año_ingreso"
    t.string "otros"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "areas", force: :cascade do |t|
    t.string "descripcion"
    t.integer "criticidad"
    t.string "otros"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "barredoras", force: :cascade do |t|
    t.integer "patio_h9"
    t.integer "m21_m22"
    t.integer "san_diego"
    t.integer "j09"
    t.integer "circunvalacion"
    t.integer "mmpp"
    t.integer "a202"
    t.integer "coke"
    t.integer "cal"
    t.string "comentarios"
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

  create_table "envasadoras", force: :cascade do |t|
    t.integer "llenado_bb"
    t.integer "bodega_bb"
    t.integer "costado"
    t.integer "silo_28"
    t.integer "bba_fuller"
    t.integer "exterior_bodega"
    t.integer "carga_ventomatic"
    t.integer "calle_servicio"
    t.integer "edificio_ventomatic"
    t.integer "edificio_haver"
    t.integer "palletizador_haver"
    t.integer "recuperado_bb"
    t.integer "sector_escombros"
    t.text "comentarios"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total"
  end

  create_table "estado_canchas", force: :cascade do |t|
    t.integer "quilimari"
    t.integer "cachinales"
    t.integer "ñilhue"
    t.integer "caolin"
    t.integer "fierro"
    t.integer "puzolana"
    t.integer "tunga"
    t.integer "ceniza"
    t.integer "yeso"
    t.integer "conchuela"
    t.integer "san_pedro"
    t.text "observaciones"
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
    t.integer "total"
  end

  create_table "evaluacions", force: :cascade do |t|
    t.bigint "sector_id", null: false
    t.integer "barrido"
    t.integer "orden"
    t.integer "derrames"
    t.integer "promedio"
    t.string "comentarios"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sector_id"], name: "index_evaluacions_on_sector_id"
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

  create_table "inspections", force: :cascade do |t|
    t.bigint "plant_id", null: false
    t.bigint "area_id", null: false
    t.bigint "tarea_id", null: false
    t.bigint "supervisor_id", null: false
    t.integer "trabajadores"
    t.boolean "ast"
    t.boolean "pts"
    t.boolean "epp"
    t.boolean "subsitio"
    t.integer "cumplimiento"
    t.text "comentarios"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "apr_id", null: false
    t.index ["apr_id"], name: "index_inspections_on_apr_id"
    t.index ["area_id"], name: "index_inspections_on_area_id"
    t.index ["plant_id"], name: "index_inspections_on_plant_id"
    t.index ["supervisor_id"], name: "index_inspections_on_supervisor_id"
    t.index ["tarea_id"], name: "index_inspections_on_tarea_id"
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

  create_table "mantenimientos", force: :cascade do |t|
    t.date "fecha_programada"
    t.date "fecha_ejecucion"
    t.string "area"
    t.string "tarea"
    t.string "clase"
    t.string "departamento"
    t.string "estado"
    t.string "observacion"
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

  create_table "plants", force: :cascade do |t|
    t.string "descripcion"
    t.integer "personal"
    t.string "otros"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "puzolanas", force: :cascade do |t|
    t.string "C403BC02_tensado_cinta"
    t.string "C403BC02_alineamiento"
    t.string "C403BC02_Polines"
    t.string "C403BC02_fugas"
    t.string "C403BC03_tensado_cinta"
    t.string "C403BC03_alineamiento"
    t.string "C403BC03_Polines"
    t.string "C403BC03_fugas"
    t.string "C403BC04_tensado_cinta"
    t.string "C403BC04_alineamiento"
    t.string "C403BC04_Polines"
    t.string "C403BC04_fugas"
    t.string "C403BC05_tensado_cinta"
    t.string "C403BC05_alineamiento"
    t.string "C403BC05_Polines"
    t.string "C403BC05_fugas"
    t.string "C403BC06_tensado_cinta"
    t.string "C403BC06_alineamiento"
    t.string "C403BC06_polines"
    t.string "C403BC06_fugas"
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
    t.float "total"
  end

  create_table "registros", force: :cascade do |t|
    t.bigint "cancha_id", null: false
    t.integer "uso"
    t.string "fotografia"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cancha_id"], name: "index_registros_on_cancha_id"
  end

  create_table "reportes", force: :cascade do |t|
    t.string "control"
    t.string "notas"
    t.integer "avance"
    t.integer "inactividad"
    t.bigint "trabajo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trabajo_id"], name: "index_reportes_on_trabajo_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "area"
    t.string "instalacion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  create_table "supervisors", force: :cascade do |t|
    t.string "nombre"
    t.string "rut"
    t.string "cargo"
    t.integer "año_ingreso"
    t.string "otros"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tareas", force: :cascade do |t|
    t.string "descripcion"
    t.integer "criticidad"
    t.string "otros"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trabajos", force: :cascade do |t|
    t.date "inicio"
    t.date "termino"
    t.string "area"
    t.string "supervisor"
    t.string "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
  add_foreign_key "evaluacions", "sectors"
  add_foreign_key "inspections", "aprs"
  add_foreign_key "inspections", "areas"
  add_foreign_key "inspections", "plants"
  add_foreign_key "inspections", "supervisors"
  add_foreign_key "inspections", "tareas"
  add_foreign_key "registros", "canchas"
  add_foreign_key "reportes", "trabajos"
  add_foreign_key "services", "users"
  add_foreign_key "trucks", "mmpps"
end
