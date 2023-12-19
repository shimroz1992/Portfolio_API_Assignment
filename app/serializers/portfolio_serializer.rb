# frozen_string_literal: true

# Serializer for Portfolio model
class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :trades
end
