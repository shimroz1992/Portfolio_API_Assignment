# frozen_string_literal: true

module Api
  module V1
    class StocksController < ApplicationController
      def index
        stocks = Stock.all
        render json: stocks
      end

      def create
        stock = Stock.new(stock_params)
        if stock.save
          render json: stock, status: :created
        else
          render json: { error: stock.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        stock = Stock.find(params[:id])
        if stock.update(stock_params)
          render json: stock
        else
          render json: { error: stock.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        stock = Stock.find(params[:id])
        stock.destroy
        head :no_content
      end

      private

      def stock_params
        params.require(:stock).permit(:id, :name)
      end
    end
  end
end
