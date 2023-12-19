# frozen_string_literal: true

# Migration to create trades table
class CreateTrades < ActiveRecord::Migration[7.1]
  def change
    create_table :trades do |t|
      t.datetime :date
      t.float :price
      t.integer :trade_type
      t.integer :stock_count

      t.references :portfolio, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
