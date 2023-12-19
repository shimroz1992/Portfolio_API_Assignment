# frozen_string_literal: true

# spec/requests/api/v1/trades_spec.rb
require 'swagger_helper'

# rubocop:disable Metrics/BlockLength
describe 'Trades API' do
  path '/api/v1/addTrade' do
    post 'Creates a trade' do
      tags 'Trades'
      consumes 'application/json'
      parameter name: :trade, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string, format: :date },
          price: { type: :number },
          trade_type: { type: :string },
          stock_count: { type: :integer },
          portfolio_id: { type: :integer },
          stock_id: { type: :integer }
        },
        required: %w[date price trade_type stock_count portfolio_id stock_id]
      }

      response '201', 'trade created' do
        let(:trade) do
          { date: '2023-12-15', price: 100, trade_type: 'buy', stock_count: 10, portfolio_id: 1, stock_id: 1 }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:trade) do
          { date: '2023-12-15', price: 'invalid', trade_type: 'buy', stock_count: 10, portfolio_id: 1, stock_id: 1 }
        end
        run_test!
      end
    end
  end

  path '/api/v1/updateTrade/{id}' do
    parameter name: :id, in: :path, type: :string

    post 'Updates a trade' do
      tags 'Trades'
      consumes 'application/json'
      parameter name: :trade, in: :body, schema: {
        type: :object,
        properties: {
          date: { type: :string, format: :date },
          price: { type: :number },
          trade_type: { type: :string },
          stock_count: { type: :integer },
          portfolio_id: { type: :integer },
          stock_id: { type: :integer }
        },
        required: %w[date price trade_type stock_count portfolio_id stock_id]
      }

      response '200', 'trade updated' do
        let(:id) { create(:trade).id }
        let(:trade) do
          { date: '2023-12-15', price: 150, trade_type: 'sell', stock_count: 5, portfolio_id: 1, stock_id: 1 }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:id) { create(:trade).id }
        let(:trade) do
          { date: '2023-12-15', price: 'invalid', trade_type: 'sell', stock_count: 5, portfolio_id: 1, stock_id: 1 }
        end
        run_test!
      end
    end
  end
  path '/api/v1/removeTrade/{id}' do
    parameter name: :id, in: :path, type: :string

    delete 'Deletes a trade' do
      tags 'Trades'
      produces 'application/json'
      response '204', 'trade deleted' do
        let(:trade_id) { create(:trade).id }

        before do
          delete "/api/v1/trades/#{trade_id}"
        end

        it 'deletes a trade successfully' do
          expect(response).to have_http_status(204)
        end
      end
    end
  end
end
# rubocop:enable  Metrics/BlockLength
