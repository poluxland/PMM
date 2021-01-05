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

ActiveRecord::Schema.define(version: 2021_01_05_215244) do

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

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "rut"
    t.string "fono"
    t.string "direccion"
    t.string "sede"
    t.string "otros"
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

  create_table "equipos", force: :cascade do |t|
    t.string "modelo_ue"
    t.string "modelo_ui"
    t.string "ubicacion_ue"
    t.string "ubicacion_ui"
    t.string "año"
    t.string "serie"
    t.string "gas"
    t.string "voltaje"
    t.string "oficinas"
    t.string "nombre_oficinas"
    t.string "unidad_master"
    t.bigint "cliente_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_equipos_on_cliente_id"
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

  create_table "servicios", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.bigint "equipo_id", null: false
    t.string "enchufes"
    t.string "cables"
    t.string "conecciones"
    t.string "estructura"
    t.string "corrosion"
    t.string "bases"
    t.string "ventiladores"
    t.string "condensador"
    t.string "compresor"
    t.string "evapodador"
    t.string "linea_refrigetante"
    t.string "aislacion"
    t.string "correas"
    t.string "lubricacion"
    t.string "drenajes"
    t.string "filtro_de_aire"
    t.string "carcasa"
    t.string "partida_normal"
    t.string "vibraciones_y_ruido"
    t.string "luces_e_indicacdores"
    t.string "direccion_de_ventiladores"
    t.string "nivel_de_aceite"
    t.string "nivel_de_refrigerante"
    t.string "pruebas_de_funcionamiento"
    t.string "alarmas"
    t.string "sobrecalor"
    t.string "sobrecalentamiento"
    t.string "presion_de_succion"
    t.string "presion_de_descarga"
    t.string "tarjeta_de_control"
    t.string "compresor_f1"
    t.string "compresor_f2"
    t.string "compresor_f3"
    t.string "compresor_m"
    t.string "ventilador_compresor_f1"
    t.string "ventilador_compresor_f2"
    t.string "ventilador_compresor_f3"
    t.string "ventilador_compresor_m"
    t.string "ventilador_evaporador_inyeccion_f1"
    t.string "ventilador_evaporador_inyeccion_f2"
    t.string "ventilador_evapodar_f3"
    t.string "ventilador_evaporador_m"
    t.string "ventilador_retorno_f1"
    t.string "ventilador_retorno_f2"
    t.string "ventilador_retorno_f3"
    t.string "ventilador_retorno_m"
    t.string "calefactor_f1"
    t.string "calefactor_f2"
    t.string "calefactor_f3"
    t.string "calefactor_m"
    t.string "cable_poder_f1"
    t.string "cable_poder_f2"
    t.string "cable_poder_f3"
    t.string "cable_poder_m"
    t.string "tension_total_f1"
    t.string "tension_total_f2"
    t.string "tension_total_f3"
    t.string "tension_total_m"
    t.text "detalles"
    t.text "insumos_repuestos"
    t.string "firma_solicitante"
    t.string "firma_tecnico"
    t.string "imagen_1"
    t.string "imagen_2"
    t.string "imagen_3"
    t.string "codigo_qr"
    t.string "otros"
    t.date "fecha"
    t.string "servicio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_servicios_on_cliente_id"
    t.index ["equipo_id"], name: "index_servicios_on_equipo_id"
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
  add_foreign_key "equipos", "clientes"
  add_foreign_key "registros", "canchas"
  add_foreign_key "services", "users"
  add_foreign_key "servicios", "clientes"
  add_foreign_key "servicios", "equipos"
  add_foreign_key "trucks", "mmpps"
end
