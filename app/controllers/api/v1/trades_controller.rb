# frozen_string_literal: true

module Api
  module V1
    # Controller responsible for managing Trades
    class TradesController < ApplicationController
      def create_trade
        @trade = Trade.new(trade_params)
        if @trade.save
          render json: @trade, status: :created
        else
          render json: @trade.errors, status: :unprocessable_entity
        end
      end

      def update_trade
        @trade = Trade.find(params[:id])
        if @trade.update(trade_params)
          render json: @trade
        else
          render json: @trade.errors, status: :unprocessable_entity
        end
      end

      def remove_trade
        @trade = Trade.find(params[:id])
        if @trade.destroy
          render json: { message: 'Trade deleted successfully' }, status: :no_content
        else
          render json: { error: 'Unable to delete trade' }, status: :unprocessable_entity
        end
      end

      private

      def trade_params
        params.require(:trade).permit(:date, :price, :trade_type, :stock_count, :portfolio_id, :stock_id)
      end
    end
  end
end
