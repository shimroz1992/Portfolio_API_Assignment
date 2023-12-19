# frozen_string_literal: true

# Migration to create portfolios table
class CreatePortfolios < ActiveRecord::Migration[7.1]
  def change
    create_table :portfolios do |t|
      t.string :name

      t.timestamps
    end
  end
end
