# frozen_string_literal: true

# Represents a stock in the application, associated with specific attributes and behavior.
class Stock < ApplicationRecord
  belongs_to :portfolio, optional: true
  has_many :trades

  validates :name, uniqueness: true
end
