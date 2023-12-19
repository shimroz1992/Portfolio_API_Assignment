# frozen_string_literal: true

# Represents a portfolio, inherits from ApplicationRecord
class Portfolio < ApplicationRecord
  has_many :trades
  has_many :stocks, through: :trades
end
