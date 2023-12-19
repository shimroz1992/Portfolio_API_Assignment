# frozen_string_literal: true

# Serializer for Stock model
class StockSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :trades
end
