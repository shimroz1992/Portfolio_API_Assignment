# frozen_string_literal: true

# Serializer for Trade model
class TradeSerializer < ActiveModel::Serializer
  attributes :id, :date, :price, :trade_type, :stock_count, :stock_name

  belongs_to :stock
  belongs_to :portfolio

  def stock_name
    object.stock.name # Assuming 'name' is the attribute representing the stock name
  end
end
