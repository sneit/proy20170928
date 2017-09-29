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

ActiveRecord::Schema.define(version: 0) do

  create_table "alquilar_canchita", primary_key: "id_alquiler", force: :cascade do |t|
    t.integer "id_persona",          limit: 4,                null: false
    t.integer "id_horario_canchita", limit: 4,                null: false
    t.date    "fecha_alquiler",                               null: false
    t.time    "hora_inicio",                                  null: false
    t.time    "hora_fin",                                     null: false
    t.decimal "costo_por_hora",                precision: 10
  end

  add_index "alquilar_canchita", ["id_horario_canchita"], name: "fk_alquilar_canchita_horarios_canchita1_idx", using: :btree
  add_index "alquilar_canchita", ["id_persona"], name: "fk_alquilar_canchita_persona1_idx", using: :btree

  create_table "boleta", id: false, force: :cascade do |t|
    t.string   "nro_boleta",    limit: 45,                          null: false
    t.decimal  "monto_total",              precision: 10, scale: 2
    t.datetime "fecha_boleta"
    t.integer  "id_cliente",    limit: 4,                           null: false
    t.integer  "id_arrendador", limit: 4,                           null: false
  end

  create_table "cancha_fulbito", primary_key: "id_canchita", force: :cascade do |t|
    t.string  "nombre_canchita", limit: 45,                             null: false
    t.string  "descripcion",     limit: 45,                             null: false
    t.string  "tipo_gras",       limit: 45,                             null: false
    t.decimal "ancho_m",                       precision: 10, scale: 2, null: false
    t.decimal "largo_m",                       precision: 10, scale: 2, null: false
    t.binary  "imagen",          limit: 65535
    t.integer "id_local",        limit: 4,                              null: false
  end

  add_index "cancha_fulbito", ["id_local"], name: "local_id_idx", using: :btree

  create_table "comentario", primary_key: "id_comentario", force: :cascade do |t|
    t.string  "comentario",  limit: 200
    t.integer "calificar",   limit: 4
    t.integer "id_canchita", limit: 4,   null: false
  end

  add_index "comentario", ["id_canchita"], name: "fk_comentario_cancha_fulbito1_idx", using: :btree

  create_table "detalle_alquiler_boleta", primary_key: "item", force: :cascade do |t|
    t.string  "nro_boleta",  limit: 45,                         null: false
    t.string  "id_alquiler", limit: 45,                         null: false
    t.integer "cantidad",    limit: 4
    t.decimal "sub_total",              precision: 8, scale: 2
  end

  add_index "detalle_alquiler_boleta", ["id_alquiler"], name: "fk_canchitas_x_boleta_alquilar_canchita1_idx", using: :btree
  add_index "detalle_alquiler_boleta", ["nro_boleta"], name: "fk_canchitas_x_boleta_boletas1_idx", using: :btree

  create_table "detalle_servicio_boleta", primary_key: "Item", force: :cascade do |t|
    t.string  "nro_boleta",  limit: 45,                         null: false
    t.integer "id_servicio", limit: 4,                          null: false
    t.integer "cant",        limit: 4
    t.decimal "sub_total",              precision: 8, scale: 2
  end

  add_index "detalle_servicio_boleta", ["id_servicio"], name: "fk_servicios_x_boletas_servicio_adicional1_idx", using: :btree
  add_index "detalle_servicio_boleta", ["nro_boleta"], name: "fk_servicios_x_boletas_boletas1_idx", using: :btree

  create_table "distrito", primary_key: "id_distrito", force: :cascade do |t|
    t.string "nombre_dist", limit: 60, null: false
  end

  create_table "google_maps", primary_key: "id_google_maps", force: :cascade do |t|
    t.string "nom_google_maps", limit: 80
    t.string "dir_google_maps", limit: 45
    t.float  "latitud",         limit: 24
    t.float  "longitud",        limit: 24
    t.string "tipo_local",      limit: 60
  end

  create_table "horarios_canchita", primary_key: "id_horario_canchita", force: :cascade do |t|
    t.boolean "status",                                           null: false
    t.decimal "precio_base",             precision: 10, scale: 2, null: false
    t.integer "id_canchita",  limit: 4,                           null: false
    t.integer "id_promocion", limit: 4
    t.time    "hora_inicio",                                      null: false
    t.time    "hora_fin",                                         null: false
    t.string  "dia_fecha",    limit: 45,                          null: false
  end

  add_index "horarios_canchita", ["id_canchita"], name: "cancha_fulbito_id_idx", using: :btree
  add_index "horarios_canchita", ["id_promocion"], name: "fk_horarios_canchita_promociones1_idx", using: :btree

  create_table "local_canchita", primary_key: "id_locales", force: :cascade do |t|
    t.string  "nombre_local",    limit: 45, null: false
    t.string  "direccion_local", limit: 45, null: false
    t.string  "mapa_local",      limit: 45, null: false
    t.string  "teléfono",        limit: 45
    t.integer "id_distrito",     limit: 4,  null: false
    t.integer "id_arrendador",   limit: 4,  null: false
    t.integer "id_google_maps",  limit: 4,  null: false
  end

  add_index "local_canchita", ["id_arrendador"], name: "arrendador_id_idx", using: :btree
  add_index "local_canchita", ["id_distrito"], name: "distrito_id_idx", using: :btree
  add_index "local_canchita", ["id_google_maps"], name: "fk_locales_canchitas_google_maps1_idx", using: :btree

  create_table "persona", primary_key: "id_persona", force: :cascade do |t|
    t.string  "nro_documento",  limit: 20, null: false
    t.string  "nombre",         limit: 45, null: false
    t.string  "ape_paterno",    limit: 45, null: false
    t.string  "ape_materno",    limit: 45, null: false
    t.date    "fec_nacimiento",            null: false
    t.string  "sexo",           limit: 1,  null: false
    t.string  "email",          limit: 45, null: false
    t.string  "password",       limit: 16, null: false
    t.integer "celular",        limit: 4,  null: false
    t.string  "direccion",      limit: 45, null: false
    t.integer "id_tipo_doc",    limit: 4,  null: false
    t.integer "id_rol",         limit: 4,  null: false
    t.integer "id_distrito",    limit: 4,  null: false
  end

  add_index "persona", ["email"], name: "email_UNIQUE", unique: true, using: :btree
  add_index "persona", ["id_distrito"], name: "fk_arrendador_distrito1_idx", using: :btree
  add_index "persona", ["id_rol"], name: "fk_persona_rol1_idx", using: :btree
  add_index "persona", ["id_tipo_doc"], name: "tipo_documento_id_idx", using: :btree

  create_table "promocion", primary_key: "id_promocion", force: :cascade do |t|
    t.float   "nombre",      limit: 53, null: false
    t.string  "descripción", limit: 45, null: false
    t.boolean "estado",                 null: false
  end

  create_table "publicidad", primary_key: "id_publicidad", force: :cascade do |t|
    t.string  "titulo",       limit: 200
    t.date    "fecha_inicio"
    t.date    "fecha_fin"
    t.integer "num_clicks",   limit: 4
    t.integer "ubi_pagi",     limit: 4
    t.integer "id_canchita",  limit: 4,   null: false
  end

  add_index "publicidad", ["id_canchita"], name: "fk_publicidad_cancha_fulbito1_idx", using: :btree

  create_table "rol", primary_key: "id_rol", force: :cascade do |t|
    t.string "nombre",      limit: 45, null: false
    t.string "descripcion", limit: 45, null: false
  end

  create_table "servicio_adicional", primary_key: "id_servicio", force: :cascade do |t|
    t.string  "descripcion", limit: 45
    t.decimal "precio",                 precision: 10, scale: 2
  end

  create_table "stock_servicios", id: false, force: :cascade do |t|
    t.integer "id_sevicio", limit: 4, null: false
    t.integer "id_cancha",  limit: 4, null: false
    t.integer "cantidad",   limit: 4
  end

  add_index "stock_servicios", ["id_cancha"], name: "id_canchita_idx", using: :btree

  create_table "sub_comentario", primary_key: "id_sub_comentario", force: :cascade do |t|
    t.string  "sub_comentario", limit: 200
    t.integer "id_comentario",  limit: 4,   null: false
  end

  add_index "sub_comentario", ["id_comentario"], name: "fk_sub_comentario_comentario1_idx", using: :btree

  create_table "tipo_documento", primary_key: "id_tipo_doc", force: :cascade do |t|
    t.string "nombre_doc", limit: 45
  end

end
