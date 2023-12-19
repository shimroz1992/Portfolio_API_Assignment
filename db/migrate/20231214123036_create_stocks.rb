# frozen_string_literal: true

# This migration creates the Stocks table
class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      # Adding a column called 'name' of type string
      t.string :name

      # Adding a column called 'name' of type string
      t.timestamps
    end
  end
end
