# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

sample_protfolio = Portfolio.create!(name: 'Test')
stock1 = Stock.create!(name: 'RELIANCE')
stock2 = Stock.create!(name: 'HDFC_BANK')
Trade.create(date: 2.day.ago, price: 900, trade_type: 'buy', stock_count: 100, portfolio_id: sample_protfolio.id,
             stock_id: stock1.id)
Trade.create(date: 1.day.ago, price: 1000, trade_type: 'sell', stock_count: 50, portfolio_id: sample_protfolio.id,
             stock_id: stock1.id)
Trade.create(date: Time.now, price: 850, trade_type: 'buy', stock_count: 100, portfolio_id: sample_protfolio.id,
             stock_id: stock1.id)
Trade.create(date: 1.day.ago, price: 1000, trade_type: 'buy', stock_count: 200, portfolio_id: sample_protfolio.id,
             stock_id: stock2.id)
Trade.create(date: Time.now, price: 800, trade_type: 'sell', stock_count: 100, portfolio_id: sample_protfolio.id,
             stock_id: stock2.id)
