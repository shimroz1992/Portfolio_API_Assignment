# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_231_214_123_840) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'portfolios', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'stocks', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'trades', force: :cascade do |t|
    t.datetime 'date'
    t.float 'price'
    t.integer 'trade_type'
    t.integer 'stock_count'
    t.bigint 'portfolio_id'
    t.bigint 'stock_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['portfolio_id'], name: 'index_trades_on_portfolio_id'
    t.index ['stock_id'], name: 'index_trades_on_stock_id'
  end

  add_foreign_key 'trades', 'portfolios'
  add_foreign_key 'trades', 'stocks'
end
