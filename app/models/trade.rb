# frozen_string_literal: true

# Represents a trade in the application, capturing details of a transaction.
class Trade < ApplicationRecord
  belongs_to :stock
  belongs_to :portfolio

  validates :date, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  enum trade_type: { buy: 0, sell: 1 }
end
