# frozen_string_literal: true

module Api
  module V1
    # Controller responsible for managing portfolios
    class PortfolioController < ApplicationController
      # Returns a list of portfolios with associated stocks and trades
      def index
        portfolios = PortfolioService.index
        render json: portfolios, include: ['stocks.trades']
      end

      # Returns the details of a specific portfolio
      def show
        portfolio = PortfolioService.show(params)
        if portfolio
          render json: portfolio, serializer: PortfolioSerializer
        else
          render json: { error: 'Portfolio not found' }, status: :not_found
        end
      end

      # Returns holdings data for a specific portfolio
      def holdings
        holdings_data = PortfolioService.holdings(params)
        render json: holdings_data
      end

      # Returns returns data for a specific portfolio
      def returns
        returns_data = PortfolioService.returns(params)
        render json: returns_data
      end
    end
  end
end
